Feature: Change a person
  This is what I do when I know who I want to call,
  But I fat-fingered their name or something

  Background:
    Given I have a valid API key
    And some people exist

  Scenario: Update the full name
    When I change a person's name to "Seriously, I am a person"
    Then the person's name should be updated
    And the JSON should indicate the update

  Scenario: Update the nickname
    When I change a person's nickname to "A Wacky Duder"
    Then the person's nickname should be updated
    And the JSON should indicate the update

    @wip @pending_situations
  Scenario: Update the situations via an array
    When I change a person's situations with an array of situation ids
    Then the person's situations should be updated
    And the JSON should indicate the update

    @wip @pending_situations
  Scenario: Update the situations via CSV
    When I change a person's situations with a CSV list of situation ids
    Then the person's situations should be updated
    And the JSON should indicate the update
