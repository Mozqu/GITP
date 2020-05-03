class AddColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :table_name, :string
  end
end
