Feature: Add events
  In order to maintain the list of events
  #An admin
  #Should be able to add funds to a batch

  @javascript
  Scenario: Should be able to add an event to the events page [FULLSCREEN]
    When I go to the events page
    And I resize window to large
    And I click on Add
    And I fill in 'Event Name' with 'Event 1'
    And I fill in 'Description' with 'Event description'
    And I click on Add
    Then I should see the following events
     | Name    | Description         |
     | Event 1 | Event description   |  

  @javascript
  Scenario: Should be able to add an event to the events page [MOBILE]
    When I go to the events page
    And I resize window to small
    And I click on Add
    And I fill in 'Event Name' with 'Event 1'
    And I fill in 'Description' with 'Event description'
    And I click on Add
    Then I should see the following events
     | Name    | 
     | Event 1 |
    And I should not see description