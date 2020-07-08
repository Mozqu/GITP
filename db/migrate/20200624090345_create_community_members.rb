class CreateCommunityMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :community_members do |t|
      t.integer :community_id
      t.integer :user_id
      t.string :authority
      t.string :allowed

      t.timestamps
    end
  end
end
