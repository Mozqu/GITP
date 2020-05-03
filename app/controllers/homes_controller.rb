class HomesController < ApplicationController
  def index
    @posts = Post.all
    @boards = Board.all
    @all_items = @posts + @boards
    @all_items.sort_by!{|a| a[:created_at]}.reverse!
  end
end
