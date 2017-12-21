class CreateTaggings < ActiveRecord::Migration[5.1]
  def change
    create_table :taggings do |t|
      t.integer :tag_id
      t.integer :url_id


      t.timestamps
    end
      add_index [:tag_id,:url_id], unique: true
      add_index :tag_id,:url_id, unique: true
  end
end
