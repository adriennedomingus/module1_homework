class Tool < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  validates :name, presence: true

  def formatted_price
    "$#{price / 100.00}"
  end
end
