class ChangePostHashtagsToPostsHashtags < ActiveRecord::Migration[5.2]
  def change
    rename_table :post_hashtags, :posts_hashtags
  end
end
