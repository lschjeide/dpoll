Feature: Add events
  In order to maintain the list of events
  #An admin
  #Should be able to add funds to a batch

  Scenario: Should be able to add an event to the events page
    When I go to the events page
    And I fill in 'Event Name' with 'Event 1'
    And I fill in 'Description' with 'Event description'
    And I click on Add
    Then I should see Event Name in the list
    And I should see Event description in the list