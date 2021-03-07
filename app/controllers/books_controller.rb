class BooksController < ApplicationController
  def index
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_id)
    book.save
    redirect_to books_path
    # リダイレクト先確認
  end

  def edit
  end


  private
  def book_id
    params.require(:book).permit( :title, :body)
  end
end
