class StoreController < ApplicationController
  def index
    @foods = Food.order(:title)
    @cart = current_cart
  end
end
