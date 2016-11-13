class StudentLibrariesController < ApplicationController
  before_action :set_student_libraries
  before_action :set_student_library, only: [:show, :edit, :update, :destroy]

  # GET faculties/1/student_libraries
  def index
    @student_libraries = @faculty.student_libraries
  end

  # GET faculties/1/student_libraries/1
  def show
  end

  # GET faculties/1/student_libraries/new
  def new
    @student_library = @faculty.student_libraries.build
  end

  # GET faculties/1/student_libraries/1/edit
  def edit
  end

  # POST faculties/1/student_libraries
  def create
    @student_library = @faculty.student_libraries.build(student_library_params)

    if @student_library.save
      redirect_to([@student_library.faculty, @student_library], notice: 'Student library was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT faculties/1/student_libraries/1
  def update
    if @student_library.update_attributes(student_library_params)
      redirect_to([@student_library.faculty, @student_library], notice: 'Student library was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE faculties/1/student_libraries/1
  def destroy
    @student_library.destroy

    redirect_to faculty_student_libraries_url(@faculty)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_libraries
      @faculty = Faculty.find(params[:faculty_id])
    end

    def set_student_library
      @student_library = @faculty.student_libraries.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def student_library_params
      params.require(:student_library).permit(:name)
    end
end
