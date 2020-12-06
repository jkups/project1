class Company < ApplicationRecord
  belongs_to :account, optional: true
end
