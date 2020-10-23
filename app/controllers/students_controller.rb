class StudentsController < ApplicationController
  
  def index
    @students = Student.all
  end

  def show
    find_student
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to student_path(@student)
    else 
      render :new
    end
  end

  private

  def find_student
    @student = Student.find_by(id: params[:id])
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name)
  end
end
