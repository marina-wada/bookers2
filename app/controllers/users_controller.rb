class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new

  end

  def new
    @user = User.new
  end

  # def create
  #   @user = user.new(user_params)
  #   @books.user_id = current_user.id
  #   @book.save
  #   redirect_to books_path(book.id)
  # end

  def edit
    @user = User.find(params[:id])
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
