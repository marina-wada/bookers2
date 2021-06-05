class BooksController < ApplicationController
    def new
    @book = Book.new
    end

    def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      @book.save
      redirect_to books_show
    end

    def index
      @books = Book.all
      @user = User.all
    end

    def show
      @user = User.find(params[:id])
      @books = @user.books
      @book = Book.new
    end

    def destroy
    end

    def edit
    end

    private

    def book_params
      params.require(:book).permit(:title, :body, :user)
    end
end
