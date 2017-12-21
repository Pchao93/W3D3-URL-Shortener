class CreateTagtopics < ActiveRecord::Migration[5.1]
  def change
    create_table :tagtopics do |t|
      t.string :topic

      t.timestamps
    end
  end
end
