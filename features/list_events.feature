Feature: List events
  In order to view the events

  Background:
    Given the following events exist
     | name    | description         | event_date |
     | Event 1 | Event description   | 2014-10-07 |
     | Event 2 | Event nondescription| 2014-10-14 |
    And I go to the events page

  @javascript
  Scenario: Should be able to edit an event to the events page [FULLSCREEN]
    When I resize window to large
    Then I should see the following events
     | Name    | Description         | Date         | 
     | Event 1 | Event description   | Oct 7, 2014  |
     | Event 2 | Event nondescription| Oct 14, 2014 |

  @javascript
  Scenario: Should be able to edit an event to the events page [FULLSCREEN]
    When I resize window to small
    Then I should see the following events
     | Name             | Date         | 
     | Event 1          | Oct 7, 2014  |
     | Event 2          | Oct 14, 2014 |
    And I should not see description