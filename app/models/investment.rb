class Investment < ApplicationRecord
  belongs_to :property
  belongs_to :account
end
