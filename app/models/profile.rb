class Profile < ApplicationRecord
  belongs_to :user
  has_one :identity
  has_one :address
  has_one :beneficiary
  has_many :banks
  has_many :accounts

  accepts_nested_attributes_for :identity, :address

end
