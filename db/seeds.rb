# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Account.destroy_all
Investment.destroy_all
Address.destroy_all
User.destroy_all
Property.destroy_all

Property.create!(
  prop_id: 'PID' + (rand() * 1000).round.to_s,
  status: 'active',
  name: 'Oark Park',
  address: '16 Staghorn Terrace, Point Cook Victoria',
  region: 'Australia',
  prop_type: 'Single Family Home',
  value: 650000,
  currency: '$',
  total_shares: 1000,
  available_shares: 1000,
  min_shares: 1,
  description: '<p>Here is the description</p>',
  bed: 4,
  bath: 2,
  car_park: 2,
  plot_size: 1200
)
Property.create!(
  prop_id: 'PID' + (rand() * 1000).round.to_s,
  status: 'active',
  name: 'Merry Place',
  address: '80 Harrick Road, Keilor Park Victoria',
  region: 'Australia',
  prop_type: 'Condo',
  value: 350000,
  currency: '$',
  total_shares: 1000,
  available_shares: 1000,
  min_shares: 5,
  description: '<p>Here is the description</p>',
  bed: 2,
  bath: 1,
  car_park: 1,
  plot_size: 6500
)
Property.create!(
  prop_id: 'PID' + (rand() * 1000).round.to_s,
  status: 'active',
  name: 'Bronx Home',
  address: '4 York Street, Sydney NSW',
  region: 'Australia',
  prop_type: 'Apartment',
  value: 50000,
  currency: '$',
  total_shares: 500,
  available_shares: 500,
  min_shares: 3,
  description: '<p>Here is the description</p>',
  bed: 2,
  bath: 1,
  car_park: 1,
  plot_size: 800
)

u1 = User.create!(
  first_name: "John",
  last_name: "Grouch",
  email: "john@gmail.com",
  password: "password",
  user_type: "user"
)
u2 = User.create!(
  first_name: "Hannah",
  last_name: "Milky",
  email: "hannah@gmail.com",
  password: "password",
  user_type: "user"
)
u3 = User.create!(
  first_name: "Ben",
  last_name: "Uncle",
  email: "ben@gmail.com",
  password: "password",
  user_type: "user"
)
u4 = User.create!(
  first_name: "Admin",
  last_name: "Master",
  email: "admin@gmail.com",
  password: "password",
  user_type: "admin"
)

Address.create!(
  street_number: "32",
  street_name: "Monte Carlo Drive",
  suburb: "Point Cook",
  zipcode: "3030",
  state: "VIC",
  country: "Australia",
  user_id: u1.id
)
Address.create!(
  street_number: "32",
  street_name: "Monte Carlo Drive",
  suburb: "Point Cook",
  zipcode: "3030",
  state: "VIC",
  country: "Australia",
  user_id: u2.id
)
Address.create!(
  street_number: "32",
  street_name: "Monte Carlo Drive",
  suburb: "Point Cook",
  zipcode: "3030",
  state: "VIC",
  country: "Australia",
  user_id: u3.id
)
Address.create!(
  street_number: "32",
  street_name: "Monte Carlo Drive",
  suburb: "Point Cook",
  zipcode: "3030",
  state: "VIC",
  country: "Australia",
  user_id: u4.id
)
