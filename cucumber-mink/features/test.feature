Feature: basic test

  Background:
    As a Good developer
    I want to test my sites
    So that guarantee they work

  Scenario: Testing Hello World
    Given I browse "http://web"
    Given I am on homepage
    And I should see "Hello"

  Scenario: API
    Given I set api to "web"
    When I GET /
    Then response code should be 200
