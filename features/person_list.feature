Feature: Get a list of people
  This is what I do when I want to know who to call
  But only when there's not a ghost problem.
  I know who to call in that scenario.

  Scenario: Let's get that JSON list!
    Given I have a valid API key
    And some people exist
    When I request the people list
    Then I should receive a JSON array of people
