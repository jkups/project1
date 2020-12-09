class Property < ApplicationRecord
  has_many :investments

  after_validation :geocode
  geocoded_by :address
end
