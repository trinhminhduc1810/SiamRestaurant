require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "#{n}_name" }
    sequence(:username) { |n| "#{n}_username" }
    sequence(:email) { |n| "#{n}_abc@abc.com" }
    sequence(:password) { |n| "#{n}_password" }
    sequence(:confirm_password) { |n| "#{n}_password" }
    sequence(:address) { |n| "#{n}_address" }
    sequence(:old_password) { |n| "#{n}_password" }
  end

  factory :food do
    sequence(:title) { |n| "#{n}_title"}
    sequence(:description) { |n| "#{n}_description" }
    sequence(:price) { 5.99 }
    sequence(:image_url) { |n| "#{n}_image.jpg" }
  end
end
