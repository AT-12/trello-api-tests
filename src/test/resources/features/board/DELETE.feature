Feature: Delete Label

  In order to delete a Label in trello
  Authenticated as valid Trello API consumer

  Background: Sets authentication
    Given The user sets valid authentication to request

  @createBoard @functional @deleteBoard
  Scenario: Verify is possible to update a label
    When The user sends a DELETE "board" request to "/boards/{id}"
    Then Verifies response should have the "200" status code
    When The user sends a GET "board" request to "/boards/{id}"
    Then Verifies response should have the "404" status code

