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

  def last_action
    login = User.find_by(id: self.id).last_login
    time = (Time.now - login).to_i
    case
    when time < 60
      return "#{time}秒前"
    when time < 3600
      minutes = time / 60
      return "#{minutes}分前"
    when time < 86400 #24時間以内
      hours = time / 3600
      minutes = time % 3600 / 60
      return "#{hours}時間#{minutes}分前"
    when time < 604800 #一週間以内
      day = time / 86400
      return "#{day}日前"
    else
      return "#{login.month}月#{login.day}"
    end
  end
end
