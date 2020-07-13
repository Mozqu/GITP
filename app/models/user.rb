class User < ApplicationRecord


  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}

  def posts
      return Post.where(user_id: self.id)
  end

  def follower_count
    return Follower.where(user_id: self.id).count
  end

  def follow_count
    return Follower.where(follower_id: self.id).count
  end

  def is_follow?(current_user_id)
    return Follower.find_by(follower_id: current_user_id, user_id: self.id)
  end

end
