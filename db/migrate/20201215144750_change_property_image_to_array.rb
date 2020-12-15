class ChangePropertyImageToArray < ActiveRecord::Migration[5.2]
  def change
    remove_column :properties, :prop_image
    add_column :properties, :prop_images, :text, :array => true, :default => []
  end
end
