Feature: Loading Workouts
  As an MMF user
  I want to be able to load my workouts from MMF
  So that I do not have to add them manually

  Scenario: No Workouts Added
    Given I am on the homepage 
      And no workouts have been added
    When I click "Load from MMF"
    Then I should see a list of workouts