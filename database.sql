-- ===============================================================
-- OUTBACK TRUCK LINK - DATABASE SCHEMA (PostgreSQL)
-- ===============================================================

-- 1. PROFILES TABLE
-- Stores extended user information and roles
CREATE TABLE public.profiles (
  id UUID REFERENCES auth.users ON DELETE CASCADE PRIMARY KEY,
  email TEXT UNIQUE NOT NULL,
  full_name TEXT,
  phone TEXT,
  role TEXT DEFAULT 'buyer' CHECK (role IN ('admin', 'buyer', 'cargo_customer')),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 2. TRUCKS TABLE
-- Inventory of available trucks for sale
CREATE TABLE public.trucks (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  title TEXT NOT NULL,
  make TEXT NOT NULL,
  model TEXT NOT NULL,
  year INTEGER NOT NULL,
  price NUMERIC NOT NULL,
  mileage INTEGER NOT NULL,
  location TEXT NOT NULL,
  images TEXT[] NOT NULL,
  description TEXT,
  body_type TEXT NOT NULL,
  transmission TEXT NOT NULL,
  fuel_type TEXT NOT NULL,
  specs JSONB DEFAULT '{}'::jsonb,
  status TEXT DEFAULT 'available' CHECK (status IN ('available', 'sold', 'reserved')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 3. CARGO REQUESTS TABLE
-- Customer requests for cargo transport services
CREATE TABLE public.cargo_requests (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES auth.users ON DELETE CASCADE NOT NULL,
  pickup_location TEXT NOT NULL,
  delivery_location TEXT NOT NULL,
  cargo_description TEXT NOT NULL,
  cargo_weight NUMERIC NOT NULL,
  preferred_date DATE NOT NULL,
  status TEXT DEFAULT 'pending' CHECK (status IN ('pending', 'quoted', 'paid', 'in_transit', 'completed', 'cancelled')),
  quote_amount NUMERIC,
  payment_status TEXT DEFAULT 'unpaid' CHECK (payment_status IN ('unpaid', 'paid')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 4. ORDERS TABLE
-- Records of truck purchases and completed service payments
CREATE TABLE public.orders (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES auth.users ON DELETE CASCADE NOT NULL,
  truck_id UUID REFERENCES public.trucks ON DELETE SET NULL,
  amount NUMERIC NOT NULL,
  status TEXT DEFAULT 'pending' CHECK (status IN ('pending', 'completed', 'cancelled')),
  type TEXT NOT NULL CHECK (type IN ('truck_purchase', 'transport_service')),
  details JSONB DEFAULT '{}'::jsonb,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ===============================================================
-- ROW LEVEL SECURITY (RLS) POLICIES
-- ===============================================================

-- Enable RLS on all tables
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.trucks ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.cargo_requests ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.orders ENABLE ROW LEVEL SECURITY;

-- Helper function to check if user is admin
CREATE OR REPLACE FUNCTION public.is_admin()
RETURNS BOOLEAN AS $$
BEGIN
  RETURN (
    SELECT role = 'admin'
    FROM public.profiles
    WHERE id = auth.uid()
  );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- PROFILES POLICIES
CREATE POLICY "Users can view own profile" ON public.profiles FOR SELECT USING (auth.uid() = id);
CREATE POLICY "Users can update own profile" ON public.profiles FOR UPDATE USING (auth.uid() = id);
CREATE POLICY "Admins can view all profiles" ON public.profiles FOR SELECT USING (public.is_admin());

-- TRUCKS POLICIES
CREATE POLICY "Anyone can view available trucks" ON public.trucks FOR SELECT USING (true);
CREATE POLICY "Admins can manage trucks" ON public.trucks FOR ALL USING (public.is_admin());

-- CARGO REQUESTS POLICIES
CREATE POLICY "Users can view own cargo requests" ON public.cargo_requests FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can create cargo requests" ON public.cargo_requests FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Admins can manage all cargo requests" ON public.cargo_requests FOR ALL USING (public.is_admin());

-- ORDERS POLICIES
CREATE POLICY "Users can view own orders" ON public.orders FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can create own orders" ON public.orders FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Admins can view all orders" ON public.orders FOR SELECT USING (public.is_admin());

-- ===============================================================
-- TRIGGERS & FUNCTIONS
-- ===============================================================

-- Automatically create a profile entry when a new user signs up
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (id, email, full_name, role)
  VALUES (
    new.id, 
    new.email, 
    new.raw_user_meta_data->>'full_name',
    COALESCE(new.raw_user_meta_data->>'role', 'buyer')
  );
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Trigger for auth.users
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE PROCEDURE public.handle_new_user();