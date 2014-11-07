Feature: Delete events
  In order to destroy to events

  Background:
  	Given I am logged in
    And the following events exist
  	 | name    | description         | event_date |
     | Event 1 | Event description   |            |
     | Event 2 | Event nondescription|            |
    And I go to the events page

  @javascript
  Scenario: Should be able to delete an event on the events page [FULLSCREEN]
  	When I resize window to large
  	And I delete the event 'Event 1'
    Then I should see the following events
     | Name             | Description                 |  Date |
     | Event 2 			    | Event nondescription		    |       |

  @javascript
  Scenario: Should be able to delete an event on the events page [FULLSCREEN]
  	When I resize window to small
  	And I view and delete the event 'Event 1'
    Then I should see the following events
     | Name             | Date |
     | Event 2          |      |