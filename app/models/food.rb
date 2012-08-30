class Food < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title
  has_many :line_items
  before_destroy :ensure_no_line_item_ref_to
  validates :description, :title, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.1}
  validates :image_url, allow_blank: false, format: { with: %r{\.(jpg|jpeg|gif|png)$}i, message: "only jpg,jpeg,gif and png file is acceptable" }

  def ensure_no_line_item_ref_to
    if line_items.empty?
      return true
    else
      errors.add(:base, 'line items still exist')
      return false
    end
  end
end
