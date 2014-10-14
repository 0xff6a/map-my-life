Feature:
  As a determined user
  I want to be able to set workout targets
  So that I can motivate myself to train harder

  Scenario: Adding a New Target
    Given I am on the homepage
    When I click "Add Target"
      And I fill in the target details
      And I click "Set"
    Then I should see the target

  Scenario: Invalid Targets
    Given I am on the homepage
    When I click "Add Target"
      And I fill in invalid details
      And I click "Set"
    Then I should see an target error message
      And the target should not be saved  

  Scenario: Linking Workouts to Targets
    Given I have added a workout
      And I have added a target
      And I am on the homepage
    When I click "Link to Target"
      And I select a target
    Then the distance between my best workout and target are displayed