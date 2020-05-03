class Board < ApplicationRecord

  def user
    return User.find_by(id: self.user_id)
  end

  def total_likes
    return BoardLike.where(board_id: self.id).sum(:points)
  end

  def responses
    return Response.where(board_id: self.id).order(created_at: :desc)
  end

end
