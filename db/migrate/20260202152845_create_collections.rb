class CreateCollections < ActiveRecord::Migration[8.1]
  def change
    create_table :collections do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.string :slug

      t.timestamps
    end
  end
end
