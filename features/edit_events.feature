Feature: Edit events
  In order to make changes to events

  Background:
  	Given I am logged in
    And the following events exist
  	 | name    | description         | event_date |
     | Event 1 | Event description   | 2014-10-07 |
     | Event 2 | Event nondescription| 2014-10-14 |
    And I go to the events page

  @javascript
  Scenario: Should be able to edit an event to the events page [FULLSCREEN]
  	When I resize window to large
  	And I edit the event 'Event 1'
    And I fill in 'Event Name' with 'Event 1 modified'
    And I fill in 'Description' with 'Event description modified'
    And I fill in 'Date' with '2014-10-20'
    And I click on Save
    Then I should see the following events
     | Name             | Description                 | Date |
     | Event 1 modified | Event description modified  | Oct 20, 2014 |
     | Event 2 			| Event nondescription		  | Oct 14, 2014 |

  @javascript
  Scenario: Should be able to edit an event to the events page [FULLSCREEN]
  	When I resize window to small
  	And I view and edit the event 'Event 1'
    And I fill in 'Event Name' with 'Event 1 modified'
    And I fill in 'Description' with 'Event description modified'
    And I fill in 'Date' with '2014-10-20'
    And I click on Save
    Then I should see the following events
     | Name             | Date |
     | Event 1 modified | Oct 20, 2014 |
     | Event 2          | Oct 14, 2014 |