class CreateFollows < ActiveRecord::Migration[8.1]
  def change
    create_table :follows do |t|
      t.integer :follower_id, null: false
      t.string :followable_type, null: false
      t.integer :followable_id, null: false

      t.timestamps
    end
    
    add_index :follows, :follower_id
    add_index :follows, [:followable_type, :followable_id]
    add_index :follows, [:follower_id, :followable_type, :followable_id], unique: true, name: 'unique_follows'
  end
end
