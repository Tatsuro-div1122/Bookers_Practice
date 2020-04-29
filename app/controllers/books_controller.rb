class BooksController < ApplicationController

  before_action :authenticate_user!
  before_action :book_unaccess, only: [:edit]

  def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
  	if @book.save
  		flash[:notice] = "successfully"
  		redirect_to book_path(@book.id)
  	else
  		@books = Book.all
  		@user = current_user
  		render :index
  	end
  end

  def index
  	@books = Book.all
  	@book = Book.new
  	@user = current_user
  end

  def show
    @book = Book.new
    @user = current_user
    @created_book = Book.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end


  private

  def book_params
  	params.require(:book).permit(:title, :body)
  end

  def book_unaccess
    book = Book.find(params[:id])
    if current_user != book.user
      redirect_to books_path
    end
  end
  
end
