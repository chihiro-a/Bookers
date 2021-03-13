class BooksController < ApplicationController
  def index
    @book = Book.new
    # index内で空の@bookを作成することができる！
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end


  def create
    # @book = Book.new
    # new内での定義ではなくcreate内で定義した
    @book = Book.new(book_params)
    @book.save
    redirect_to ("/books/#{@book[:id]}"),notice: 'Book was successfully created.'

    # リダイレクト先確認　showへ
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to ("/books/#{book[:id]}"),notice: 'Book was successfully updated.'
    # Showへリダイレクト
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to("/books")
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
    # require(:book).の記述を抜くと編集ができない。入れると新規投稿ができない。
  end
end
