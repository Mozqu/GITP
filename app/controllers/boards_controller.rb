class BoardsController < ApplicationController
  def index
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(
      user_id: @current_user.id,
      title: params[:title],
      content: params[:content],
      table_name: "boards",
      community: params[:community].to_i
    )
    if params[:image]
      @board.image_name1 = "#{@board.id}_1"
      image = params[:image]
      File.binwrite("public/board_images/#{@board.image_name1}", image.read)
    end
    if @board.save
      redirect_to("/boards/#{@board.id}")
    else
      render("/boards/new")
    end
  end

  def show
    @board = Board.find_by(id: params[:id])
  end

end
