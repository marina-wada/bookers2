class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = @user.book.page(params[:page]).reverse_order
  end
end