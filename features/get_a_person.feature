Feature: Get a person
  This is what I do when I know who I want to call,
  But do not know how to get a hold of them

  Scenario: Get me the person already!
    Given I have a valid API key
    And some people exist
    When I request the info for one of the people
    Then I should receive a JSON person
