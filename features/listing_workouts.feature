Feature: Listing Workouts
  As an active user
  I want to be able to log a list of my workouts
  So that I can analyse them to improve performance

  Scenario: No Workouts Added
    Given I am on the homepage 
      And no workouts have been added
    Then I should see "No workouts yet - shape up!"

  Scenario: Adding a Workout
    Given I am on the homepage
    When I click "New Workout"
      And I fill in the workout details
      And I click "Add"
    Then I should see my workout listed

  Scenario: Editing a Workout
    Given I have added a workout
      And I am on the homepage
    When I click "Edit"
      And I update the workout details
      And I click "Update"
    Then I should see the updated details listed

  Scenario: Deleting a Workout
    Given I added an incorrect workout
      And I am on the homepage
    When I click "Delete"
    Then the workout should be removed