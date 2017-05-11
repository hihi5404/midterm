class BooksController < ApplicationController
  before_action :find_book,only:[:show, :edit, :update]
  def index 
    @books=Book.all
  end
  
  def show
   @book=Book.find_by(id: params[:id])
  end
  
   def new
    @book=Book.new
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
       redirect_to books_path
    else
      render 'new'
    end  
  end
  
   def edit
   end
  
  def update
    if @book.update(book_params)
      redirect_to books_path, notice:"update!"
    else
    render 'edit'
    end
  end
  
    private
    def find_book
      @book = Book.find_by(id: params[:id])
      redirect_to books_path, notice:"no data!" if @book.nil?
    end
  
   def book_params
      params.require("book").permit(:name, :introduction, :author, :price)
   end
  
end

