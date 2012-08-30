Given /^I'm being in the index page of foods$/ do
  visit('/foods/')
end

When /^I click the New Food button$/ do
  click_link('New Food')
end

When /^I fill all required information$/ do
  within('#new_food') do
    fill_in('Title', :with => 'Chicken')
    fill_in('Description', :with => 'delicious')
    fill_in('Price', :with => 5.99)
    fill_in('Image url', :with => 'img.jpg')
  end
end

When /^I click the Create Food button$/ do
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

Then /^I should see the error "(.*?)"$/ do |error|
    within('#error_explanation') do
      page.should have_content(error)
    end
end

