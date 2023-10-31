Feature: News article tests

Scenario: representative search functionality
  Given I am on the representatives page
  Then I should see "Search for a Representative"
  When I fill in "address" with "Colorado"
  When I press "Search"
  Then I should see "Melissa Hart"

Scenario: news article page
  Given I am on the representatives page
  When I fill in "address" with "Oregon"
  When I press "Search"
  Then I should see "Governor of Oregon"
  When I go to the news page of Kate Brown
  Then I should see "Kate Brown Articles"

Scenario: Part 1 Test
  Given I am on the representatives page
  When I fill in "address" with "Oregon"
  When I press "Search"
  When I go to the add news page of Kate Brown
  Then I should see "Sign In"
  Given I am on the login page
  When I press "Sign in with Google"
  When I go to the add news page of Kate Brown
  Then I should see "New news article"

Scenario: New Article
  Given I am on the representatives page
  When I fill in "address" with "Oregon"
  When I press "Search"
  When I go to the add news page of Kate Brown
  Then I should see "Sign In"
  Given I am on the login page
  When I press "Sign in with Google"
  When I go to the add news page of Kate Brown
  Then I should see "New news article"
  When I select "Kate Brown" from "news_item[representative_id]"
  When I press "commit"


Scenario: Issue Attribute
  Given I am on the representatives page
  When I fill in "address" with "CA"
  When I press "Search"
  When I go to the add news page of Fiona Ma
  Then I should see "Sign In"
  Given I am on the login page
  When I press "Sign in with Google"
  When I go to the add news page of Fiona Ma
  Then I should see "New news article"
  When I select "Fiona Ma" from "news_item[representative_id]"
  When I select "Free Speech" from "news_item[issue]"
  When I press "Search"
  Then I should see "Edit News Item"

