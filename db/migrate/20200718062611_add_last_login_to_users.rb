class AddLastLoginToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_login, :smalldatetime
  end
end
