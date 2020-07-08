class AddIsOpenToCommunities < ActiveRecord::Migration[5.2]
  def change
    add_column :communities, :is_open, :string
  end
end
