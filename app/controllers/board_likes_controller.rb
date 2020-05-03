class BoardLikesController < ApplicationController
  def create_like
    @board = BoardLike.find_by(
      user_id: @current_user.id,
      board_id: params[:id]
    )
    if @board
      @board.destroy
    end
    @board = BoardLike.new(
      user_id: @current_user.id,
      board_id: params[:id],
      points: 1
    )
    if @board.save
      redirect_to("/boards/#{@board.board_id}")
    else
      render("/boards/#{params[:id]}")
    end

  end

  def destroy_like
    @board = BoardLike.find_by(
      user_id: @current_user.id,
      board_id: params[:id],
      points: 1
    )
    if @board.destroy
      redirect_to("/boards/#{@board.board_id}")
    else
      render("/boards/#{params[:id]}")
    end
  end

  def create_dislike
    @board = BoardLike.find_by(
      user_id: @current_user.id,
      board_id: params[:id]
    )
    if @board
      @board.destroy
    end
    @board = BoardLike.new(
      user_id: @current_user.id,
      board_id: params[:id],
      points: -1
    )
    if @board.save
      redirect_to("/boards/#{@board.board_id}")
    else
      render("/boards/#{params[:id]}")
    end
  end

  def destroy_dislike
    @board = BoardLike.find_by(
      user_id: @current_user.id,
      board_id: params[:id],
      points: -1
    )
    if @board.destroy
      redirect_to("/boards/#{params[:id]}")
    else
      render("/boards/#{params[:id]}")
    end
  end
end
