#https://github.com/turingschool/lesson_plans/blob/master/ruby_01-object_oriented_programming_with_ruby/object_oriented_programming.markdown#exercise---25-minutess

class Car

  attr_accessor :color, :wheel_count, :started

  def initialize(started = false)
    @started = started
  end


  def horn
    "BEEEEEP!"
  end

  def drive(distance)
    "I'm driving #{distance} miles"
  end

  def report_color
    "I am #{color}"
  end

  def wheel_count(wheels)
    "This sweet ride is sitting on #{wheels} wheels"
  end

  def start
    if started == false
      puts "Starting up!"
      @started = true
    else
      puts "BZZT! Nice try, though."
    end
  end

end

my_car = Car.new
puts my_car.horn
puts my_car.drive(12)
my_car.color = "purple"
puts my_car.report_color
puts my_car.wheel_count(18)

my_second_car = Car.new
puts my_second_car.wheel_count(2)
my_second_car.start
my_second_car.start
