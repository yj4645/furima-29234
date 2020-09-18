class AddNamesToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :image, :integer , null:false
  end
end
