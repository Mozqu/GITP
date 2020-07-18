class FollowersController < ApplicationController
  after_action :set_last_login, only:[ :create, :destroy]

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
