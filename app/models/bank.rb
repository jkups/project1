class Bank < ApplicationRecord
  belongs_to :user

  # Need to confirm this.. i just adding the set banking id will be enough
  belongs_to :account
end
