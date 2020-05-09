class BoardLikesController < ApplicationController
  before_action :set_board

  def create_like
    @like = BoardLike.find_by(
      user_id: @current_user.id,
      board_id: params[:id]
    )
    if @like
      @like.destroy
    end
    @like = BoardLike.new(
      user_id: @current_user.id,
      board_id: params[:id],
      points: 1
    )
    @like.save
    respond_to do |format|
       format.html
       format.js
     end
  end

  def destroy_like
    @like = BoardLike.find_by(
      user_id: @current_user.id,
      board_id: params[:id],
      points: 1
    )
    @like.destroy
    respond_to do |format|
       format.html
       format.js
     end
  end

  def create_dislike
    @like = BoardLike.find_by(
      user_id: @current_user.id,
      board_id: params[:id]
    )
    if @like
      @like.destroy
    end
    @like = BoardLike.new(
      user_id: @current_user.id,
      board_id: params[:id],
      points: -1
    )
    @like.save
    respond_to do |format|
       format.html
       format.js
     end
  end

  def destroy_dislike
    @like = BoardLike.find_by(
      user_id: @current_user.id,
      board_id: params[:id],
      points: -1
    )
    @like.destroy
    respond_to do |format|
       format.html
       format.js
     end
  end

  private
  def set_board
    @board = Board.find_by(id: params[:id])
  end
end
