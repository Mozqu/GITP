class AddColumnToBoards < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :table_name, :string
  end
end
