class ResponsesController < ApplicationController
  def index
  end

  def create
    @response = Response.new(
      user_id: @current_user.id,
      board_id: params[:id],
      content: params[:content]
    )
    if @response.save
      redirect_to("/boards/#{@response.board_id}")
    else
      render("/boards/#{@response.board_id}")
    end
  end
end
