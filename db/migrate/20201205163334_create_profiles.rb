class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :email
      t.string :mobile_number
      t.string :dial_code
      t.integer :user_id

      t.timestamps
    end
  end
end
