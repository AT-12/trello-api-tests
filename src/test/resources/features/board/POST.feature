Feature: Create Board

  In order to create a board in trello
  Authenticated as valid Trello API consumer

  Background: Sets authentication
    Given The user sets valid authentication to request

  @functional @deleteBoard
  Scenario: Verify board is created with minimum required parameters
    When The user sends a POST request to "/boards" with the following Json data
      """
      {
        "name" : "New Board!",
        "desc" : "Description"
      }
     """
    Then Verifies response should have the "200" status code
    And Verifies the "board" response body should match with "board/boardSchema.json" JSON schema
    And Verifies the "board" response should contain the following values
      | name | New Board!  |
      | desc | Description |

  @negative
  Scenario: Verify board is not possible to create a board with a wrong JSON
    When The user sends a POST request to "/boards" with the following Json data
      """
      {
        "nameBoard" : "New Board!",
        "desc" : "Description"
      }
     """
    Then Verifies response should have the "400" status code
