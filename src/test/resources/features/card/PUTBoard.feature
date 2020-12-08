Feature: Update Card
  In order to update a Card in trello
  Authenticated as valid Trello API consumer

  Background: Sets authentication
    Given The user sets valid authentication to request

  @createBoard @deleteBoard @createList @createCard @deleteCard @deleteList @functional
  Scenario: Verify is possible to update a card
    When The user sends a PUT "card" request to "/cards/{id}" with the following Json data
       """
          {
            "name" :"newCardTest"
          }
       """
    Then Verifies response should have the "200" status code
    And Verifies the "card" response body should match with "/card/messageResponse.json" JSON schema
    And Verifies the "card" response should contain the following values
      | name  | newCardTest |

  @createBoard @deleteBoard @createList @createCard @deleteCard @deleteList @negative
  Scenario: Verify is not possible to update a card with invalid id
    When The user sends a PUT "card" request to "/cards/invalidId" with the following Json data
       """
          {
            "name" :"newCardTest"
          }
       """
    Then Verifies response should have the "400" status code

  @createBoard @deleteBoard @createList @createCard @deleteCard @deleteList @functional
  Scenario: Verify is possible to update the description of card
    When The user sends a PUT "card" request to "/cards/{id}" with the following Json data
       """
          {
            "desc" :"new description!"
          }
       """
    Then Verifies response should have the "200" status code
    And Verifies the "card" response body should match with "/card/messageResponse.json" JSON schema
    And Verifies the "card" response should contain the following values
      | desc  | new description! |
