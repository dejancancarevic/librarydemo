class FacultiesController < ApplicationController
  before_action :set_faculties
  before_action :set_faculty, only: [:show, :edit, :update, :destroy]

  # GET universities/1/faculties
  def index
    @faculties = @university.faculties
  end

  # GET universities/1/faculties/1
  def show
  end

  # GET universities/1/faculties/new
  def new
    @faculty = @university.faculties.build
  end

  # GET universities/1/faculties/1/edit
  def edit
  end

  # POST universities/1/faculties
  def create
    @faculty = @university.faculties.build(faculty_params)

    if @faculty.save
      redirect_to([@faculty.university, @faculty], notice: 'Faculty was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT universities/1/faculties/1
  def update
    if @faculty.update_attributes(faculty_params)
      redirect_to([@faculty.university, @faculty], notice: 'Faculty was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE universities/1/faculties/1
  def destroy
    @faculty.destroy

    redirect_to university_faculties_url(@university)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_faculties
      @university = University.find(params[:university_id])
    end

    def set_faculty
      @faculty = @university.faculties.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def faculty_params
      params.require(:faculty).permit(:name)
    end
end
