Feature: Delete Board

  In order to delete a Board in trello
  Authenticated as valid Trello API consumer

  Background: Sets authentication
    Given The user sets valid authentication to request

  @createBoard @functional @deleteBoard
  Scenario: Verify is possible to delete a board
    When The user sends a DELETE "board" request to "/boards/{id}"
    Then Verifies response should have the "200" status code
    When The user sends a GET "board" request to "/boards/{id}"
    Then Verifies response should have the "404" status code

  @negative
  Scenario: Verify that is not possible delete a board
    When The user sends a DELETE "board" request to "/boards/badNumber"
    Then Verifies response should have the "400" status code
