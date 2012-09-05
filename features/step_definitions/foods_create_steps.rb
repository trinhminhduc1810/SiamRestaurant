World(FoodsCreateHelper)

Given /^I'm being in the index page of foods$/ do
  visit('/foods/')
end

And /^I click the New Food button$/ do
  click_link('New Food')
end

Given /^I fill all required information$/ do
  fill_information('chicken','delicious',5.99,'image.jpg')
end

And /^I click the Create Food button$/ do
  within('#new_food') do
    click_button('Create Food')
  end
end

Then /^I will be redirected to show page$/ do
  page.should have_link('Back')
  page.should have_link('Edit')
end

Then /^I should see the inform "([^"]*)"$/ do |message|
  within('p#notice') do
    page.should have_content(message)
  end
end

Then /^I should see the error "([^"]*)"$/ do |error|
  find(:xpath, "//div[@id='error_explanation']/ul/li[1]").text.should == error
end

Given /^I fill all information except title$/ do
  fill_information('','delicious',5.99,'image.url')
end

Given /^I fill all information except description$/ do
  fill_information('chicken','',5.99,'image.url')
end

Given /^I fill all information with the price is "(.*?)"$/ do |price|
  fill_information('chicken','delicious',price,'image.url')
end

Given /^I fill all information with the image_url is "(.*?)"$/ do |image_url|
  fill_information('chicken','delicious',5.99,image_url)
end
