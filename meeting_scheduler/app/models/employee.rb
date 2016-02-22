class Employee < ActiveRecord::Base
  has_many :meetings, as: :meetable
end
