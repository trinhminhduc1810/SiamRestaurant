require 'spec_helper'

describe FoodsController do
    context "#add new food with successful task" do
      it "should redirect to the show details of new food" do
        post :create, :food => {
                               :title => 'chicken curry',
                               :description => 'delicious',
                               :image_url => 'chicken.jpg',
                               :price => 5.99
                            }
        result = assigns(:food)
        result.id.should_not == nil
        response.should redirect_to food_path(:id => result.id)
      end
    end
end
