class User < ApplicationRecord
  has_one :profile
  has_one :identity, through: 'profile'
  has_one :address, through: 'profile'
  has_many :accounts, through: 'profile'
  has_many :banks, through: 'profile'
  has_many :beneficiaries, through: 'profile'

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true, length: {minimum: 2}
  # , format: { with: /[A-Za-z]/}
  validates :password, length:{ minimum: 8 }
  # , format: { with: }
end
