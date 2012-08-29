class Food < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title
  validates :description, :title, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.1}
  validates :image_url, allow_blank: false, format: { with: %r{\.(jpg|jpeg|gif|png)$}i, message: "only jpg,jpeg,gif and png file is acceptable" }
end
