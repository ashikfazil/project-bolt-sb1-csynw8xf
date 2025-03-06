/*
  # Property Management Schema

  1. New Tables
    - `properties`
      - `id` (uuid, primary key)
      - `owner` (text)
      - `address` (text)
      - `property_type` (text)
      - `floors` (integer)
      - `year_built` (integer)
      - `square_footage` (numeric)
      - `coordinates` (jsonb) - Stores GeoJSON data
      - `created_at` (timestamptz)
      - `user_id` (uuid) - References auth.users
      
  2. Security
    - Enable RLS on properties table
    - Add policies for CRUD operations
    - Only authenticated users can create properties
    - Users can only read/update/delete their own properties
*/

-- Create properties table
CREATE TABLE properties (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  owner text NOT NULL,
  address text NOT NULL,
  property_type text NOT NULL,
  floors integer,
  year_built integer,
  square_footage numeric NOT NULL,
  coordinates jsonb NOT NULL,
  created_at timestamptz DEFAULT now(),
  user_id uuid REFERENCES auth.users NOT NULL
);

-- Enable RLS
ALTER TABLE properties ENABLE ROW LEVEL SECURITY;

-- Policies
CREATE POLICY "Users can create their own properties"
  ON properties
  FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can view their own properties"
  ON properties
  FOR SELECT
  TO authenticated
  USING (auth.uid() = user_id);

CREATE POLICY "Users can update their own properties"
  ON properties
  FOR UPDATE
  TO authenticated
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can delete their own properties"
  ON properties
  FOR DELETE
  TO authenticated
  USING (auth.uid() = user_id);