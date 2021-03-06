class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new

  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
    redirect_to user_path(current_user) unless current_user.id == @user.id
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
    else
       render "edit"
    end
  end

  def index
    @users = User.all
    @user = current_user
    @book_new = Book.new
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
