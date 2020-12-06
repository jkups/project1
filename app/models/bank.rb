class Bank < ApplicationRecord
  belongs_to :profile
  belongs_to :account
end
