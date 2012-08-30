class CombineLineItemsInCart < ActiveRecord::Migration
  def up
    Cart.all.each do |cart|
      sums = cart.line_items.group(:food_id).sum(:quantity)
      sums.each do |food_id, quantity|
        if quantity > 1
          cart.line_items.where(food_id: food_id).delete_all
          cart.line_items.create(food_id: food_id, quantity: quantity)
        end
      end
    end
  end

  def down
  end
end
