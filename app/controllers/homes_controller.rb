class HomesController < ApplicationController
  def index
    @posts = Post.all
    @boards = Board.all
    @all_items = @posts + @boards
    @all_items.sort_by!{|a| a[:created_at]}.reverse!
  end

  def sort
    @all_items = []
    hashtags = []
    words = []
    #検索ワードをspaceで分割更にhashかどうかで分ける
    if params[:search]
      search_words = params[:search].split
      search_words.each do |word|
        if word.chars[0] == "#"
          hashtags = hashtags.push(word)
        else
          words = words.push(word)
        end
      end
    end
    #検索結果をpost, boardで分けて取得
    if params[:post]
      @posts = Post.search_content(words)
      @all_items = @all_items + @posts
    end
    if params[:board]
      @boards = Board.search(words)
      @all_items = @all_items + @boards
    end
    @all_items.sort_by!{|a| a[:created_at]}.reverse!
    render("/homes/index")
  end
end
