class CoursesController < ApplicationController
  def index
    Course.all.each do |course|
      render :text => "#{course.name}, #{course.students.first.first_name}"
    end
  end

  def show
    course = Course.find(params[:id])
    render :text => "#{course.name}, #{course.students.first.first_name} Showing"
  end
end
