class PostHashtag < ApplicationRecord
  belongs_to :post
  belongs_to :hashtag
  validates  :post_id, presence: true
  validates  :hashtag_id,   presence: true

  def post_hashtag_save
    Post_hashtag.create(post_id: post.id, hashtag_id: tag)
  end

end
