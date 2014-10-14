Feature: Vote on an event
  In order to vote for an event

  Background:
    Given the following events exist
     | name    | description            | event_date |
     | DMT 	   | DMT Talkerwalker       | 2014-10-07 |
    And I go to vote for 'DMT'

   @javascript
   Scenario: Should be able to vote for an event [FULLSCREEN]
    When I resize window to large
    And I vote 'Yes'
    Then I should be thanked for my feedback
    And there should be 1 'Yes' vote for event 'DMT'

   @javascript
   Scenario: Should be able to vote for an event [MOBILE]
    When I resize window to small
    And I vote 'No'
    Then I should be thanked remorsefully for my feedback
    And there should be 1 'No' vote for event 'DMT'

