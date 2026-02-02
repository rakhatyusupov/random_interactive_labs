class CreateArticles < ActiveRecord::Migration[8.1]
  def change
    # Drop existing articles table if it exists
    drop_table :articles, if_exists: true
    
    create_table :articles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :slug
      t.integer :status, default: 0
      t.datetime :published_at
      t.integer :approved_by_id

      t.timestamps
    end
    
    add_index :articles, :slug, unique: true
    add_index :articles, :status
    add_foreign_key :articles, :users, column: :approved_by_id
  end
end
