class BooksController < ApplicationController
  
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する
    @books = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    if  @book.save
    flash[:create] = 'Book was successfully created.'
    redirect_to book_path(@book.id)
    else
    @books = Book.all
    render :index
    
    end
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      flash[:update] = 'Book was successfully updated.'
      
    redirect_to book_path(@book.id)
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end

