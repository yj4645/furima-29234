class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,              foreign_key:true
      t.string     :name,              null: false
      t.integer    :price,             null: false
      t.text       :explanation,       null: false
      t.integer    :category_id,       null: false
      t.integer    :burden_id,         null: false
      t.integer    :prefecture_id,     null: false
      t.integer    :shipping_days_id,  null: false
      t.integer    :status_id,         null: false

      t.timestamps
    end
  end
end