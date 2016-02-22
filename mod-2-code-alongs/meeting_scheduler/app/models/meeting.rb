class Meeting < ActiveRecord::Base
  belongs_to :meetable, polymorphic: true
end
