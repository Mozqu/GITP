class AddCommunityToBoards < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :community, :integer

  end
end
