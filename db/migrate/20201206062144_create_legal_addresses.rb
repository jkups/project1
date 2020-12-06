class CreateLegalAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :legal_addresses do |t|
      t.string :street_number
      t.string :street_name
      t.string :suburb
      t.string :zipcode
      t.string :state
      t.string :country
      t.integer :account_id

      t.timestamps
    end
  end
end
