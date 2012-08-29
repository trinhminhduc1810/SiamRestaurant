class StoreController < ApplicationController
  def index
    @foods = Food.order(:title)
  end
end
