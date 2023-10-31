Feature: Map tests

Scenario: National Map
  Given I am on the home page 
  Then I should see "National Map"

Scenario: State Page
  Given a state is seeded
  Given I am on the state page
  Then I should see "Alabama"
  When I press "Counties in Alabama"
  Then I should see "Test County"