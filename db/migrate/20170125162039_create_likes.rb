class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.integer :liker_id
      t.integer :liked_id

      t.timestamps
    end
    add_index :likes , :liker_id
    add_index :likes , :liked_id
    add_index :likes , [:liker_id, :liked_article_id] , unique: true
  end
end
