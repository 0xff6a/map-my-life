Feature: Listing Workouts
  As an active user
  I want to be able to log a list of my workouts
  So that I can analyse them to improve performance

  Scenario: No Workouts Added
    Given I am on the homepage 
      And no workouts have been added
    Then I should see "No workouts yet - shape up!"