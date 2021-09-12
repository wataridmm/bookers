class BooksController < ApplicationController
  
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
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
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to '/books'
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  
  private
  def book_params
    params.permit(:title, :body)
  end
  
end

