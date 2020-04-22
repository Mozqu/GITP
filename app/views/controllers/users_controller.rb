class UsersController < ApplicationController
  def index
      @users = User.all
    end

  def show
      @user = User.find_by(id: params[:id])
  end
#ユーザー登録　by Motoya#
  def new
  @user = User.new
  end

  def create
  @user = User.new(
    name: params[:name],
    email: params[:email],
    image_name: "default_user.jpg",
    password: params[:password]
    )
    if @user.save
    session[:user_id] = @user.id
    flash[:notice] = "ユーザー登録が完了しました"
    redirect_to("/users/#{@user.id}")
    else
    render("users/new")
    end
  end

end
