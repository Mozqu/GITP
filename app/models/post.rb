class Post < ApplicationRecord

  def user
    return User.find_by(id: self.user_id)
  end

  def likes_count
    return Like.where(post_id: self.id).count;
  end

end
