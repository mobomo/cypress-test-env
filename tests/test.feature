Feature: Test Feature
  Scenario: Load a site
    When I visit 'https://docker.com'
    Then element 'h3.sub-h1' should exist
