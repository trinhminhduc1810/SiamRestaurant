Feature: Create New Food
  Restaurant has a new food, owner want to add new food into 
  he/she website for advertising

  Scenario: Go to New page,full fill information and click create food
    Given I'm being in the index page of foods
    When I click the New Food button
    And  I fill all required information
    And  I click the Create Food button
    Then I will be redirected to show page 
    And I should see the inform "Food was successfully created."

  Scenario: Go to New page,not fill anything and click create food
    Given I'm being in the index page of foods
    When I click the New Food button
    And I click the Create Food button
    Then I should see the error "4 errors prohibited this food from being saved:"
