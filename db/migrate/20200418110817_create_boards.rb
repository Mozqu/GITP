class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.string :image_name1
      t.string :image_name2
      t.string :image_name3
      t.string :image_name4

      t.timestamps
    end
  end
end
