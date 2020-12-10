class Investment < ApplicationRecord
  belongs_to :property
  belongs_to :account

  attribute :property_name, :string
end
