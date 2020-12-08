class CreateBanks < ActiveRecord::Migration[5.2]
  def change
    create_table :banks do |t|
      t.string :bank_location
      t.string :bank_code
      t.string :bank_name
      t.string :account_number
      t.string :account_name
      t.string :provider_account_id
      t.string :provider_id
      t.string :transfercode_type
      t.string :transfercode_id
      t.date :last_verified
      t.integer :user_id
      t.integer :account_id

      t.timestamps
    end
  end
end
