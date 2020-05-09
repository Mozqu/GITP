class BoardLike < ApplicationRecord
  validates :user_id, {presence: true}
  validates :board_id, {presence: true, uniqueness: true}
end
