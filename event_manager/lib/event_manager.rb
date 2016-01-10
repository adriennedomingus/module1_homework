#http://tutorials.jumpstartlab.com/projects/eventmanager.html

require 'csv'
require 'sunlight/congress'
require 'erb'

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, "0")[0..4]
end

def clean_phone(phone_number)
  phone_number = phone_number.to_s.gsub(/\D/, '')
  trim_country_code(phone_number)
  if phone_number.length != 10
    phone_number = "0000000000"
  else
    phone_number
  end
end

def trim_country_code(phone_number)
  if phone_number.length > 10 && phone_number[0] == "1"
    phone_number = phone_number.chars.drop(1).join
  else
    phone_number
  end
end

def legislators_by_zipcode(zipcode)
  Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

def save_thank_you_letters(id,form_letter)
  Dir.mkdir("output") unless Dir.exists?("output")
  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

puts "EventManager Initialzied!"

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter

contents.each do |row|
  id = row[0]
  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])

  home_number = clean_phone(row[:home_phone])

  legislators = legislators_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)

  save_thank_you_letters(id, form_letter)

end
