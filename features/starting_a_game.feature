Feature: Starting the game
  In order to play battleships
  As a nostalgic player
  I want to start a new game

 Scenario: Registering 
    Given I am on the homepage
    When I follow "New Game"
    Then I should see "What's your name?"

 Scenario: No name given
 	Given I am on the player page
 	And I don't type a "name"
 	When I click on "submit"
 	Then I should see "Please enter a name"

