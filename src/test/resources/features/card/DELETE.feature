Feature: Delete Card
  In order to delete a Card in trello
  Authenticated as valid Trello API consumer

  Background: Sets authentication
    Given The user sets valid authentication to request

  @createBoard @createList @createCard @deleteCard @deleteList @deleteBoard @functional
  Scenario: Verify is possible to delete a card
    When The user sends a DELETE "card" request to "/cards/{id}"
    Then Verifies response should have the "200" status code
    When The user sends a GET "card" request to "/cards/{id}"
    Then Verifies response should have the "404" status code

  @createBoard @createList @createCard @deleteCard @deleteList @deleteBoard @negative
  Scenario: Verify that is not possible delete a card
    When The user sends a DELETE "card" request to "/cards/invalidId"
    Then Verifies response should have the "400" status code