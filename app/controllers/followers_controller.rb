class FollowersController < ApplicationController
  def index
  end

  def create
    @follower = Follower.create(
      user_id: params[:id],
      follower_id: @current_user.id
    )
    @user = User.find_by(id: params[:id])
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @follower = Follower.find_by(user_id: params[:id], follower_id: @current_user.id)
    @follower.destroy
  end
end
