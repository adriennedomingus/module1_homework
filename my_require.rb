#https://github.com/turingschool/lesson_plans/blob/09d7c87815fa60d4b917cf90c21337fad9e74a0f/ruby_01-object_oriented_programming_with_ruby/load_path_and_require.markdown

def my_require(filename)
  directory = $LOAD_PATH.find do |directory|
    File.exist?("#{directory}/#{filename}.rb")
  end
  if directory
    path = "#{directory}/#{filename}.rb"
    ruby_code = File.read(path)
    eval(ruby_code)
  else
    raise LoadError, "cannot load such file -- #{filename}"
  end
end

my_require("date")
p Date.parse("2015-03-05")
