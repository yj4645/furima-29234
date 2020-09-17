class RenameExpalanationColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :expalanation, :explanation
  end
end
