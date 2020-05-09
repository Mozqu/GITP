class Post < ApplicationRecord
  validates :content, {presence: true}
  validates :table_name, {presence: true}

  after_create :create_hash_tag

  def user
    return User.find_by(id: self.user_id)
  end

  def likes_count
    return Like.where(post_id: self.id).count;
  end

  private
  def create_hash_tag
    post = Post.find_by(id: self.id)
    tags = post.post_tags.split
    tags.each do |tag|
      hash = Hashtag.find_or_create_by(hashname: tag)
    end
  end

end
