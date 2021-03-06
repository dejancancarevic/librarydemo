class UniversitiesController < ApplicationController
  before_action :set_university, only: [:show, :edit, :update, :destroy]
  before_action :create_university, only: [:create]

  # Whenever single object is in question this will authorize it
  before_action :authorize_single_resource
  # Whenever collection is in question this will authorize it
  before_action :authorize_index_resources


  # GET /universities
  # GET /universities.json
  def index
    @universities = University.all
  end

  # GET /universities/1
  # GET /universities/1.json
  def show
  end

  # GET /universities/new
  def new
    @university = University.new
  end

  # GET /universities/1/edit
  def edit
  end

  # POST /universities
  # POST /universities.json
  def create
    respond_to do |format|
      if @university.save
        format.html { redirect_to @university, notice: 'University was successfully created.' }
        format.json { render :show, status: :created, location: @university }
      else
        format.html { render :new }
        format.json { render json: @university.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /universities/1
  # PATCH/PUT /universities/1.json
  def update
    respond_to do |format|
      if @university.update(university_params)
        format.html { redirect_to @university, notice: 'University was successfully updated.' }
        format.json { render :show, status: :ok, location: @university }
      else
        format.html { render :edit }
        format.json { render json: @university.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /universities/1
  # DELETE /universities/1.json
  def destroy
    @university.destroy
    respond_to do |format|
      format.html { redirect_to universities_url, notice: 'University was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  protected

  def authorize_resource_actions
    super + %w( clone )
  end

  def authorize_single_resource
    super(@university)
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_university
    @university = University.find(params[:id])
  end

  def create_university
    @university = University.new(university_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def university_params
    params.require(:university).permit(:name)
  end






end
