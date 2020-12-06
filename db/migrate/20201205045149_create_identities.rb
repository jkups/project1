class CreateIdentities < ActiveRecord::Migration[5.2]
  def change
    create_table :identities do |t|
      t.string :document_type
      t.string :document_id
      t.date :expiry_date
      t.string :issue_country
      t.boolean :validated
      t.integer :profile_id

      t.timestamps
    end
  end
end
