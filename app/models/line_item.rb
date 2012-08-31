class LineItem < ActiveRecord::Base
  attr_accessible :quantity, :cart_id, :food_id
  belongs_to :cart
  belongs_to :food

  def total_price
    total = food.price * quantity
    return total
  end
end
