Feature: Get Card
  In order to get a Card in trello
  Authenticated as valid Trello API consumer

  Background: Sets authentication
    Given The user sets valid authentication to request

  @createBoard @createList @createCard @deleteCard @deleteList @deleteBoard @functional @smoke
  Scenario: Verify is possible to obtain a card
    When The user sends a GET "card" request to "/cards/{id}"
    Then Verifies response should have the "200" status code
    And Verifies the "card" response body should match with "/card/messageResponse.json" JSON schema
    And Verifies the "card" response should contain the following values
      | name | {name} |
      | desc | {desc} |

  @createBoard @createList @deleteList @createCard @deleteCard @deleteBoard @functional
  Scenario: Verify is not possible to obtain a card with invalid id
    When The user sends a GET "card" request to "/cards/invalidId"
    Then Verifies response should have the "400" status code

  @createBoard @createList @createCard @deleteCard @deleteList @deleteBoard @functional
  Scenario: Verify is possible to obtain the board a card is on
    When The user sends a GET "card" request to "/cards/{id}/board"
    Then Verifies response should have the "200" status code

  @createBoard @createList @createCard @deleteCard @deleteList @deleteBoard @functional
  Scenario: Verify is possible to obtain the list a card is in
    When The user sends a GET "card" request to "/cards/{id}/list"
    Then Verifies response should have the "200" status code
