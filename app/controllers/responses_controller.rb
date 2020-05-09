class ResponsesController < ApplicationController
  before_action :set_board

  def index
  end

  def create
    @response = Response.new(
      user_id: @current_user.id,
      board_id: params[:id],
      content: params[:content]
    )
    @response.save
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
