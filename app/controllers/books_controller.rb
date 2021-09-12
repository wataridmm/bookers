class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する
    @book = Book.new
  end
  
  def create
    book = Book.new(book_params)
    book.save
    redirect_to '/books'
  end

  def edit
  end
  
  private
  def book_params
    params.permit(:title, :body)
  end
  
end

