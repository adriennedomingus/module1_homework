class Fan < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  default_scope { order(:name) }

  def self.joined_since(date)
    where(["created_at > ?", date])
  end
end
