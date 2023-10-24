class GradesController < ApplicationController
  before_action :set_grade, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :require_teacher, only: [:destroy]

  # GET /grades
  def index
      sort_by = params[:sort_by]
      @grades = Grade.all
      if sort_by.present?
        @grades = @grades.order("student_grade #{sort_by}")
      end
  end

  # GET /grades/1
  def show
  end

  # GET /grades/new
  def new
      @grade = Grade.new
  end

  # GET /grades/1/edit
  def edit

  end

  # POST /grades
  def create
    @grade = Grade.new(grade_params)

    if @grade.save
      redirect_to @grade, notice: 'Grade was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /grades/1
  def update
    if @grade.update(grade_params)
      redirect_to @grade, notice: 'Grade was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /grades/1
  def destroy
    @grade.destroy
    redirect_to grades_url, notice: 'Grade was successfully destroyed.'
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @grade = Grade.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def grade_params
      params.require(:grade).permit(:student_id, :student_name, :student_grade)
    end

    def require_teacher
      unless current_user.teacher?
        flash[:notice] = "Access denied."
        redirect_to grades_path
      end
    end
    
end
