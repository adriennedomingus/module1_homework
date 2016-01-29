# https://github.com/turingschool/challenges/blob/master/ruby_in_ruby.markdown

 class SimpleArray
   attr_reader :data

   def initialize(the_data = [])
     @data = the_data
   end

   def first
     data[0]
   end

   def last
     data[-1]
   end

   def join(connector = "")
     result = ""
     data.each do |element|
       result << element + connector
     end
     result[0..-connector.length - 1]
   end

   def count
     count = 0
     data.each do |element|
       count += 1
     end
     count
   end
 end
