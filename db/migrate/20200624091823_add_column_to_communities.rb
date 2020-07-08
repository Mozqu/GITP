class AddColumnToCommunities < ActiveRecord::Migration[5.2]
  def change
    add_column :communities, :rule, :string
    add_column :communities, :introduce, :string
    add_column :communities, :published, :string
  end
end
