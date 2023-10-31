Feature: Representative tests

Scenario: Representatives Page
  Given I am on the representatives page
  Then I should see "Search for a Representative"
  When I fill in "address" with "Colorado"
  When I press "Search"
  Then I should see "Melissa Hart"
  When I follow "Melissa Hart"
  Then I should see "Melissa Hart"
  Then I should see "2 East 14th Avenue"
  Then I should see "Nonpartisan"