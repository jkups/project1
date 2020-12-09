 class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :prop_id
      t.string :status
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :region
      t.float :value
      t.string :currency
      t.integer :total_shares
      t.integer :available_shares
      t.integer :min_shares
      t.text :description
      t.string :prop_type
      t.string :prop_image
      t.integer :bed
      t.integer :bath
      t.integer :plot_size
      t.integer :car_park

      t.timestamps
    end
  end
end
