class FollowersController < ApplicationController
  def index
  end

  def create
    @follower = Follower.new(
      user_id: params[:id],
      follower_id: @current_user.id
    )
    if @follower.save
      redirect_to("/users/#{@follower.user_id}")
    else
      render("/users/#{@follower.user_id}")
    end
  end
end
