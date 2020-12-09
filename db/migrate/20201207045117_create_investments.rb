class CreateInvestments < ActiveRecord::Migration[5.2]
  def change
    create_table :investments do |t|
      t.float :invest_amount
      t.integer :invest_share
      t.float :trxn_fee
      t.float :total_due
      t.boolean :split_pay
      t.string :trxn_ref
      t.string :trxn_code
      t.string :trxn_status, default: 'pending'
      t.string :trxn_message
      t.string :pay_method
      t.integer :property_id
      t.integer :account_id

      t.timestamps
    end
  end
end
