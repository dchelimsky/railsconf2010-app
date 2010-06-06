Feature: Manage cards
  In order to document a new user story
  As a team member
  I want to create a story card

  Scenario: Create card
    Given a default swimlane named "backlog"
    And I am on the new card page
    And I fill in "Title" with "Card 1"
    And I press "Create"
    Then I should see the following cards in the "backlog" swimlane:
      | title  |
      | Card 1 |
      
  Scenario: Update body
    Given the following cards:
      | title   | body      |
      | Dinner  | Meat      |
      | Dessert | Ice cream |
    When I edit the "Dessert" card
    And I fill in "Body" with "Fruit"
    And I press "Save"
    Then I should see "Fruit"
  
  Scenario: Cards in multiple swimlanes
    Given the following cards:
      | title    | swimlane |
      | Aperitif | now      |
      | Dinner   | next     |
      | Dessert  | next     |
    When I go to the cards page
    Then I should see the following cards in the "now" swimlane:
      | title    |
      | Aperitif |
    And I should see the following cards in the "next" swimlane:
      | title   |
      | Dinner  |
      | Dessert |

    But I should not see the following cards in the "next" swimlane:
      | title    |
      | Aperitif |
    And I should not see the following cards in the "now" swimlane:
      | title   |
      | Dinner  |
      | Dessert |
    