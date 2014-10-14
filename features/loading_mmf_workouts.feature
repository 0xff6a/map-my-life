Feature: Loading Workouts
  As an MMF user
  I want to be able to load my workouts from MMF
  So that I do not have to add them manually

  Scenario: No Workouts Added
    Given I am on the homepage 
      And no workouts have been added
    When I click "Load from MMF"
    Then I should see a list of workouts

  Scenario: Not Duplicating Workouts
    Given I have loaded my workouts from MMF
      And I have not logged any new workouts
    When I click "Load from MMF"
    Then the number of workouts should not change