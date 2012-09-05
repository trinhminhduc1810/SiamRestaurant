@javascript
Feature: Create New Food
  as a user, I want to add new food on website
  Background:
    Given I'm being in the index page of foods
    And I click the New Food button
  Scenario: Add new food successfully
    Given  I fill all required information
    And  I click the Create Food button
    Then I will be redirected to show page
    And I should see the inform "Food was successfully created."

  Scenario: Add new food without Title
    Given I fill all information except title
    And I click the Create Food button
    Then I should see the error "Title can't be blank"

  Scenario: Add new food without Description
    Given I fill all information except description
    And I click the Create Food button
    Then I should see the error "Description can't be blank"

  Scenario: Add new food with invalid format of price
    Given I fill all information with the price is "abc"
    And I click the Create Food button
    Then I should see the error "Price is not a number"

  Scenario: Add new food with invalid format of image url
    Given I fill all information with the image_url is "image.doc"
    And I click the Create Food button
    Then I should see the error "Image url only jpg,jpeg,gif and png file is acceptable"



