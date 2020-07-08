class Hashtag < ApplicationRecord
  validates :hashname, presence: true, uniqueness: true, length: {maximum:99}
has_many :posts, through: :posts_hashtags

  private

end
