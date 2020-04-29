class AddIdImageToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :id_image, :string
  end
end
