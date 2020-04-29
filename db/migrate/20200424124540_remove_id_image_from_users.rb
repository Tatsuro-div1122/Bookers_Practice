class RemoveIdImageFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :id_image, :string
  end
end
