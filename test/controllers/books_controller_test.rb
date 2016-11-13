require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  setup do
    @student_library = student_libraries(:one)
    @book = books(:one)
  end

  test "should get index" do
    get :index, params: { student_library_id: @student_library }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { student_library_id: @student_library }
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count') do
      post :create, params: { student_library_id: @student_library, book: @book.attributes }
    end

    assert_redirected_to student_library_book_path(@student_library, Book.last)
  end

  test "should show book" do
    get :show, params: { student_library_id: @student_library, id: @book }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { student_library_id: @student_library, id: @book }
    assert_response :success
  end

  test "should update book" do
    put :update, params: { student_library_id: @student_library, id: @book, book: @book.attributes }
    assert_redirected_to student_library_book_path(@student_library, Book.last)
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete :destroy, params: { student_library_id: @student_library, id: @book }
    end

    assert_redirected_to student_library_books_path(@student_library)
  end
end
