Feature: Create card
  In order to document a new user story
  As a team member
  I want to create a story card
  
  Scenario: create card
    Given I am on the new card page
    And I fill in "Title" with "Card 1"
    And I press "Create"
    Then I should see the following cards:
      | Title  |
      | Card 1 |
