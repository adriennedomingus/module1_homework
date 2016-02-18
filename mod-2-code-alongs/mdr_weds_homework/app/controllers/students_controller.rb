class StudentsController < ApplicationController

  def index
    Student.all.each do |student|
      render :text => "#{student.first_name} #{student.last_name}\n"
    end
  end

  def show
    @student = Student.find(params[:id])
  end

end
