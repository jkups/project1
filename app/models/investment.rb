class Investment < ApplicationRecord
  belongs_to :property
  belongs_to :account

  attribute :property_name, :string
  attribute :account_name, :string

  def pay_with_braintree nonce
    gateway = Braintree::Gateway.new(
      :environment => :sandbox,
      :merchant_id => ENV["BRAINTREE_MERCHANT_ID"],
      :public_key => ENV["BRAINTREE_PUBLIC_KEY"],
      :private_key => ENV["BRAINTREE_PRIVATE_KEY"],
    )

    result = gateway.transaction.sale(
      :amount => self.total_due.to_s,
      :payment_method_nonce => nonce,
      :options => {
        :submit_for_settlement => true
      }
    )

    result
  end

  def trxn_valid?
    self.property.available_shares >= self.invest_share
  end

  def update_trxn trxn_code, paymethod
    self.update trxn_code: trxn_code, pay_method: paymethod, trxn_status: 'successful'
    self.property.available_shares -= self.invest_share
    self.property.save
  end

end
