class BooksController < ApplicationController
  before_action :authenticate_user!
    def new
    @book = Book.new
    end

    def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      @user = current_user
      @book_new = Book.new
      @books = Book.all
      if @book.save
        redirect_to book_path(@book), notice: 'You have created book successfully.'
      else
        render "index"
      end
    end

    def index
      @books = Book.all
      @user = current_user
      @book = Book.new
    end

    def show
      @book = Book.find(params[:id])
      @user = @book.user
      @book_new = Book.new
    end

    def destroy
      @book = Book.find(params[:id])
      @book.destroy
      redirect_to books_path
    end

    def edit
      @book = Book.find(params[:id])
      redirect_to books_path unless current_user.id == @book.user.id
    end

    def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
        redirect_to book_path(@book), notice: 'You have updated book successfully.'
      else
        render "edit"
      end
    end

    private

    def book_params
      params.require(:book).permit(:title, :body)
    end
end
