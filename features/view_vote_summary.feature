Feature: View vote summary
  In order to view poll results

  Background:
    Given I am logged in
    And the following events exist
     | name    | description            | event_date |
     | DMT 	   | Dius Monthly Talk      | 2014-10-07 |
    And event 'DMT' has the following votes
      | yes | no |
      | 20  | 3  |

   @javascript
   Scenario: Should be able to view votes for an event [FULLSCREEN]
    When I resize window to large
    And I view votes for 'DMT'
    Then I should see the following votes
     | Yes | No |
     | 20  | 3  |

   @javascript
   Scenario: Should be able to view votes for an event [MOBILE]
    When I resize window to small
     And I view votes for 'DMT'
     Then I should see the following votes
       | Yes | No |
       | 20  | 3  |

