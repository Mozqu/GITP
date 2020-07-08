class Post < ApplicationRecord
  has_many :hashtags, through: :posts_hashtags
  validates :content, {presence: true}
  validates :table_name, {presence: true}

  after_create :create_hash_tag

  def user
    return User.find_by(id: self.user_id)
  end

  def likes_count
    return Like.where(post_id: self.id).count;
  end

  def self.search_content(search)
    grouping_hash_tags = search.reduce({}){|hash, word| hash.merge(word => {content_cont: word })}
    Post.ransack({ combinator: 'and', groupings: grouping_hash_tags}).result
  end
  #ハッシュタグから検索する場合　コピペしただけなので要編集
  def hashtag
    @tag = Hashtag.find_by(hashname: params[:name])
    @microposts = @tag.microposts.build
    @micropost  = @tag.microposts.page(params[:page])
    @comment    = Comment.new
    @comments   = @microposts.comments
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
