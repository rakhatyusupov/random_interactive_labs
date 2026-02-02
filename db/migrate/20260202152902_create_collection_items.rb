class CreateCollectionItems < ActiveRecord::Migration[8.1]
  def change
    create_table :collection_items do |t|
      t.references :collection, null: false, foreign_key: true
      t.string :item_type
      t.string :title
      t.string :url
      t.text :content
      t.integer :position

      t.timestamps
    end
  end
end
