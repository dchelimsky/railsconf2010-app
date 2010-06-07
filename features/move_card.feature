Feature: Move card
  In order to broadcast the progress of a card
  As a team member
  I want to move cards from one swimlane to another
  
  Scenario: move from backlog to in progress
    Given the following swimlanes:
      | name        | default | position |
      | backlog     | true    | 1        |
      | in progress | false   | 2        |
      | done        | false   | 3        |
    And the following cards:
      | title    | swimlane    |
      | Dinner   | backlog     |
      | Dessert  | backlog     |
      | Aperitif | in progress |
    When I move "Aperitif" to the "done" swimlane
    Then I should see the following cards in their respective lanes:
      | backlog | in progress | done     |
      | Dessert |             | Aperitif |
      | Dinner  |             |          |
