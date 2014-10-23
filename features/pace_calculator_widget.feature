Feature: Loading Workouts
  As a conscientious runner
  I want to be know my target pace for different training types
  So that I can optimise my training programme

  Scenario: Training Paces Widegt
    Given I am on the homepage
      And I have not logged any workouts
    Then I should see a message prompting me to add a workout

  @javascript
  Scenario: Training Paces Widegt
    Given I have logged at least one workout
      And I have saved a training pace
    When I visit the homepage
    Then I should see a training pace widget
      And the correct training paces based on my benchmark
      And the description for each pace