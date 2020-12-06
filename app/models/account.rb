class Account < ApplicationRecord
  # has_one :address
  belongs_to :profile
  has_one :bank
  has_one :company
  has_one :legal_address

  accepts_nested_attributes_for :legal_address
end
