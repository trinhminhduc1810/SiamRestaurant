class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :line_items , dependent: :destroy

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

  def add_product(food_id)
    current_item = line_items.find_by_food_id(food_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(food_id: food_id)
    end
    return current_item
  end

end
