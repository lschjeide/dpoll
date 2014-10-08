Feature: Add events
  In order to maintain the list of events

  @javascript
  Scenario: Should be able to add an event to the events page [FULLSCREEN]
    When I go to the events page
    And I resize window to large
    And I click on Add
    And I fill in 'Event Name' with 'Event 1'
    And I fill in 'Description' with 'Event description'
    And I fill in 'Date' with '2014-10-20'
    And I click on Add
    Then I should see the following events
     | Name    | Description         | Date |
     | Event 1 | Event description   | Oct 20, 2014    |

  @javascript
  Scenario: Should be able to add an event to the events page [MOBILE]
    When I go to the events page
    And I resize window to small
    And I click on Add
    And I fill in 'Event Name' with 'Event 1'
    And I fill in 'Description' with 'Event description'
    And I fill in 'Date' with '2014-10-20'
    And I click on Add
    Then I should see the following events
     | Name    | Date |
     | Event 1 | Oct 20, 2014 |