class LikesController < ApplicationController
   before_action :authenticate_user
   after_action :set_last_login, only:[ :create, :destroy]

  def index
    @post = Post.find_by(id:3)
  end

  def create
   @like = Like.new(user_id: @current_user.id, post_id: params[:post_id])
   @like.save
   @post = Post.find_by(id: params[:post_id])
   respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
   @like = Like.find_by(user_id: @current_user.id, post_id: params[:post_id])
   @like.destroy
   @post = Post.find_by(id: params[:post_id])
   respond_to do |format|
      format.html
      format.js
    end

  end



end
