#掲示板に対するレス
class Response < ApplicationRecord

  def user
    return User.find_by(id: self.user_id)
  end

end
