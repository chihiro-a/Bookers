class BooksController < ApplicationController
  def index
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    # newの中でインデックスへアクセスするよう記載できないか？？
  end

  def create
    # @book = Book.new
    # new内での定義ではなくcreate内で定義した
    @book = Book.new(book_params)
    @book.save
    redirect_to ("/books/#{@book[:id]}")
    # リダイレクト先確認　showへ
  end

  def edit
  end


  private
  def book_params
    params.permit(:title, :body)
    # require(:book).の記述を抜いた
  end
end
