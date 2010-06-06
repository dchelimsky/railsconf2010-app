Feature: Display swimlanes
  In order to see what's being worked on
  As a team member
  I want to see stories in swimlanes

  Scenario: See swimlane names
    Given the following swimlanes:
      | name        | default | position |
      | done        | false   | 3        |
      | backlog     | true    | 1        |
      | in progress | false   | 2        |
    When I go to the cards page
    Then I should see the following swimlanes in order:
      | backlog | in progress | done |
    