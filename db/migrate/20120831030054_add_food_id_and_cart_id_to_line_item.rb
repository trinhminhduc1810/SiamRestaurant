class AddFoodIdAndCartIdToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :food_id, :integer
    add_column :line_items, :cart_id, :integer
  end
end
