class BooksController < ApplicationController
  def index
    @book = Book.new
    # index内で空の@bookを作成することができる！
    @books = Book.all.order(created_at: :desc)
    # 投稿時間が新しい順に並び替える
  end

  def show
    @book = Book.find(params[:id])
  end


  def create
    @books = Book.all.order(created_at: :desc)
    # エラーメッセージを表示するために追加。create内で@booksの定義がないと
    # no method erroeになる…。indexを経由しないから@booksが見つからないっぽい？
    @book = Book.new(book_params)
    if @book.save
      redirect_to ("/books/#{@book[:id]}"),notice: 'Book was successfully created.'
       # リダイレクト先確認　showへ
    else
      render ('books/index')
      # リダイレクトからレンダーに変更。フォルダ名/ファイル名をそのまま記述する。
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    # これがないとNoMethoderroeになるけど、内容ダブってるしエラーメッセージでない…
    book = Book.find(params[:id])
    if book.update(book_params)
      redirect_to ("/books/#{book[:id]}"),notice: 'Book was successfully updated.'
      # Showへリダイレクト
    else
      render ('books/edit')
      # editへレンダー
    end
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
