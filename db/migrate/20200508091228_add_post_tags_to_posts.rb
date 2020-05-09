class AddPostTagsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :post_tags, :string
  end
end
