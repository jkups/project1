class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :email
      t.string :mobile_number
      t.string :dial_code
      t.string :document_id
      t.string :document_type
      t.date :expiry_date
      t.boolean :validated
      t.string :issue_country
      t.string :password_digest
      t.string :reset_password_token
      t.date :reset_password_expires

      t.timestamps
    end
  end
end
