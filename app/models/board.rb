class Board < ApplicationRecord
  validates :title, {presence: true}
  validates :table_name, {presence: true}

  def user
    return User.find_by(id: self.user_id)
  end

  def total_likes
    return BoardLike.where(board_id: self.id).sum(:points)
  end

  def responses
    return Response.where(board_id: self.id).order(created_at: :desc)
  end

  def self.search(search)
      grouping_hash = search.reduce({}){|hash, word| hash.merge(word => { content_cont: word })}
      Board.ransack({ combinator: 'and', groupings: grouping_hash}).result
  end

end
