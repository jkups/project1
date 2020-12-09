# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Property.destroy_all

Property.create!(
  prop_id: 'PID' + (rand() * 1000).round.to_s,
  status: 'active',
  name: 'Oark Park',
  address: '16 Staghorn Terrace, Point Cook Victoria',
  region: 'USA',
  prop_type: 'Single Family Home',
  value: 650000,
  currency: '$',
  total_shares: 1000,
  available_shares: 1000,
  min_shares: 1,
  description: '<p>Here is the description</p>',
  prop_image: '/assets/prop-img-1',
  bed: 4,
  bath: 2,
  car_park: 2,
  plot_size: 1200
)
