class Category < ActiveRecord::Base
  has_many :tools, dependent: :destroy
end
