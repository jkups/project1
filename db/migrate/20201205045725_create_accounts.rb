class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :account_name
      t.string :account_type
      t.string :account_number
      t.boolean :account_active
      t.string :company_name
      t.string :reg_number
      t.integer :user_id

      t.timestamps
    end
  end
end
