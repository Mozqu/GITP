class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @likes_count = Like.where(post_id: @post.id).count
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      user_id: @current_user.id,
      content: params[:content],
    )
    if @post.save

      if params[:image1]
        @post.image_name1 = "#{@post.id}_1"
        image = params[:image1]
        File.binwrite("public/post_images/#{@post.image_name1}", image.read)
      end
      if params[:image2]
        @post.image_name2 = "#{@post.id}_2"
        image = params[:image2]
        File.binwrite("public/post_images/#{@post.image_name2}", image.read)
      end
      if params[:image3]
        @post.image_name3 = "#{@post.id}_3"
        image = params[:image3]
        File.binwrite("public/post_images/#{@post.image_name3}", image.read)
      end
      if params[:image4]
        @post.image_name4 = "#{@post.id}_4"
        image = params[:image4]
        File.binwrite("public/post_images/#{@post.image_name4}", image.read)
      end

      if @post.save
        redirect_to("/posts/#{@post.id}")
      else
        render("posts/new")
      end
    else
      render("/posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update

  end


end
