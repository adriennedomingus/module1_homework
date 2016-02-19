class Donation < ActiveRecord::Base
  belongs_to :fan
  
  INVALID_VALUES = [1]
  validates :amount, numericality: { only_integer: true },
                     exclusion: { in: INVALID_VALUES }
  validates :status, presence: true,
                     inclusion: { in: %w(processed pending cancelled),
                     message: "%{value} is not a valid status" }
end
