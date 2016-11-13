require 'test_helper'

class FacultiesControllerTest < ActionController::TestCase
  setup do
    @university = universities(:one)
    @faculty = faculties(:one)
  end

  test "should get index" do
    get :index, params: { university_id: @university }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { university_id: @university }
    assert_response :success
  end

  test "should create faculty" do
    assert_difference('Faculty.count') do
      post :create, params: { university_id: @university, faculty: @faculty.attributes }
    end

    assert_redirected_to university_faculty_path(@university, Faculty.last)
  end

  test "should show faculty" do
    get :show, params: { university_id: @university, id: @faculty }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { university_id: @university, id: @faculty }
    assert_response :success
  end

  test "should update faculty" do
    put :update, params: { university_id: @university, id: @faculty, faculty: @faculty.attributes }
    assert_redirected_to university_faculty_path(@university, Faculty.last)
  end

  test "should destroy faculty" do
    assert_difference('Faculty.count', -1) do
      delete :destroy, params: { university_id: @university, id: @faculty }
    end

    assert_redirected_to university_faculties_path(@university)
  end
end
