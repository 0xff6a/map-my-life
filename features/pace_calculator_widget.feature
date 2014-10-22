Feature: Loading Workouts
  As a conscientious runner
  I want to be know my target pace for different training types
  So that I can optimise my training programme

  Scenario: Training Paces Widegt
    Given I am on the homepage
      And I have logged at least one workout
    Then I should see a training pace widget
      And the correct training paces based on my benchmark