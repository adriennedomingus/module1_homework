class Location < ActiveRecord::Base
  validates :city, presence: true,
                   format: { with: /\A[a-zA-Z\s]+\z/, message: "only allows uppercase and lowercase letters"},
                   uniqueness: { scope: :state }
  validates :state, presence: true
  validates :country, presence: true
  validates :state, length: { is: 2 }

  def full_name
    "#{city}, #{state}, #{country}"
  end
end
