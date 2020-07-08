class RemoveColumnFromCommunities < ActiveRecord::Migration[5.2]
  def change
    remove_column :communities, :community_id, :integer
    remove_column :communities, :user_id, :integer
    remove_column :communities, :authority, :string
    remove_column :communities, :allowed, :string
  end
end
