module FoodsCreateHelper
  def fill_information(title,description,price,image_url)
    within('#new_food') do
      fill_in('Title', :with => title)
      fill_in('Description', :with => description)
      fill_in('Price', :with => price)
      fill_in('Image url', :with => image_url)
    end
  end
end

World(FoodsCreateHelper)
