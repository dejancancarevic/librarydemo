require 'test_helper'

class StudentLibrariesControllerTest < ActionController::TestCase
  setup do
    @faculty = faculties(:one)
    @student_library = student_libraries(:one)
  end

  test "should get index" do
    get :index, params: { faculty_id: @faculty }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { faculty_id: @faculty }
    assert_response :success
  end

  test "should create student_library" do
    assert_difference('StudentLibrary.count') do
      post :create, params: { faculty_id: @faculty, student_library: @student_library.attributes }
    end

    assert_redirected_to faculty_student_library_path(@faculty, StudentLibrary.last)
  end

  test "should show student_library" do
    get :show, params: { faculty_id: @faculty, id: @student_library }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { faculty_id: @faculty, id: @student_library }
    assert_response :success
  end

  test "should update student_library" do
    put :update, params: { faculty_id: @faculty, id: @student_library, student_library: @student_library.attributes }
    assert_redirected_to faculty_student_library_path(@faculty, StudentLibrary.last)
  end

  test "should destroy student_library" do
    assert_difference('StudentLibrary.count', -1) do
      delete :destroy, params: { faculty_id: @faculty, id: @student_library }
    end

    assert_redirected_to faculty_student_libraries_path(@faculty)
  end
end
