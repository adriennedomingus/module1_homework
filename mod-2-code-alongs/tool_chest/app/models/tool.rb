class Tool < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true

  def formatted_price
    "$#{price / 100.00}"
  end
end
