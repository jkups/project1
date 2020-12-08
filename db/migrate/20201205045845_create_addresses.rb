class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street_number
      t.string :street_name
      t.string :suburb
      t.string :zipcode
      t.string :state
      t.string :country
      t.integer :user_id
      t.integer :account_id

      t.timestamps
    end
  end
end
