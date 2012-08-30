require 'spec_helper'

describe StoreController do
  before(:each) do
    (0..2).each do
    FactoryGirl.create :food
  end

  end
  context "#get success code from index" do
    it "should return success code" do
      get :index
      response.should be_success
    end
  end

  context "#render template" do
    it "should render the index template" do
      get :index
      response.should render_template("index")
    end
  end
  context "#get 3 items from index" do
    it "should return an array foods with 3 items" do
      get :index
      assigns(:foods).count.should == 3
      DatabaseCleaner.clean
    end
  end
end
