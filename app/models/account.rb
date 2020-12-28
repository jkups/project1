class Account < ApplicationRecord
  belongs_to :user
  has_one :bank
  has_many :investment
  has_one :address, dependent: :destroy

  accepts_nested_attributes_for :address, :user

  attribute :invest_amount, :float
  attribute :trxn_fee, :float
  attribute :properties, :integer
end
