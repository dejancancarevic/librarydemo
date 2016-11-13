class BooksController < ApplicationController
  before_action :set_books
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET student_libraries/1/books
  def index
    @books = @student_library.books
  end

  # GET student_libraries/1/books/1
  def show
  end

  # GET student_libraries/1/books/new
  def new
    @book = @student_library.books.build
  end

  # GET student_libraries/1/books/1/edit
  def edit
  end

  # POST student_libraries/1/books
  def create
    @book = @student_library.books.build(book_params)

    if @book.save
      redirect_to([@book.student_library, @book], notice: 'Book was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT student_libraries/1/books/1
  def update
    if @book.update_attributes(book_params)
      redirect_to([@book.student_library, @book], notice: 'Book was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE student_libraries/1/books/1
  def destroy
    @book.destroy

    redirect_to student_library_books_url(@student_library)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_books
      @student_library = StudentLibrary.find(params[:student_library_id])
    end

    def set_book
      @book = @student_library.books.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def book_params
      params.require(:book).permit(:name)
    end
end
