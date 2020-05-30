class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

      t.string :name
      t.text :description
      t.integer :genre_id
      t.integer :price
      t.integer :status, default: 0
      t.string :image_id
      t.timestamps
    end
  end
end
