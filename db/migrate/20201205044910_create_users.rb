class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :reset_password_token
      t.string :reset_password_expires
      t.string :password_digest

      t.timestamps
    end
  end
end
