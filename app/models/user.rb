class User < ApplicationRecord
  has_one :address
  has_many :accounts
  has_many :banks
  has_many :beneficiaries
  accepts_nested_attributes_for :address

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true, length: {minimum: 2}
  # , format: { with: /[A-Za-z]/}
  validates :password, length:{ minimum: 8 }, :if => lambda{ new_record? || !password.nil? }
  # , format: { with: }
end
