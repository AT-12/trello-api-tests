Feature: Delete Label
  In order to delete a Label in trello
  Authenticated as valid Trello API consumer

  Background: Sets authentication
    Given The user sets valid authentication to request

  @createBoard @createLabel @functional @deleteBoard
  Scenario: Verify is possible to delete a label
    When The user sends a DELETE "label" request to "/labels/{id}"
    Then Verifies response should have the "200" status code
    When The user sends a GET "label" request to "/labels/{id}"
    Then Verifies response should have the "404" status code

  @negative
  Scenario: Verify that is not possible delete a label
    When The user sends a DELETE "label" request to "/labels/invalidId"
    Then Verifies response should have the "400" status code