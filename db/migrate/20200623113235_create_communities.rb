class CreateCommunities < ActiveRecord::Migration[5.2]
  def change
    create_table :communities do |t|
      t.string :community_name
      t.integer :user_id
      t.string :authority
      t.string :allowed

      t.timestamps
    end
  end
end
