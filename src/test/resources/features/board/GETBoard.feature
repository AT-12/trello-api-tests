Feature: Get Board

  In order to obtain a board in trello
  Authenticated as valid Trello API consumer

  Background: Sets authentication
    Given The user sets valid authentication to request

  @createBoard @deleteBoard @smoke
  Scenario: Verify that is possible to obtain a single board
    When The user sends a GET "board" request to "/boards/{id}"
    Then Verifies response should have the "200" status code
    And Verifies the "board" response body should match with "board/listBoardSchema.json" JSON schema
    And Verifies the "board" response should contain the following values
      | id   | {id}   |
      | name | {name} |
      | desc | {desc} |

  @negative
  Scenario: Verify that is not possible obtain a single board
    When The user sends a GET "board" request to "/boards/badNumber"
    Then Verifies response should have the "400" status code
