Feature: Create Board

  In order to create a board in trello
  Authenticated as valid Trello API consumer

  Background: Sets authentication
    Given The user sets valid authentication to request

  @functional @deleteBoard
  Scenario: Verify board is created with minimum required parameters
    When the user sends a POST request to "/boards" with the following Json data
      """
      {
        "name" : "New Board!",
        "desc" : "Description"
      }
     """
    Then verifies response should have the "200" status code
    And verifies response body should match with "board/boardSchema.json" JSON schema
    And verifies response should contain the following values
      | name | New Board!  |
      | desc | Description |

  @skipScenario @createBoard
  Scenario: Verify board is updated with minimum required parameters
    When the user sends a PUT request to "/boards/{idBoard}" with the following Json data
      """
      {
        "name" : "New Board Updated!",
        "desc" : "Description Updated"
      }
     """
    Then verifies response should have the "200" status code
    And verifies response body should match with "board/boardSchema.json" JSON schema
    And verifies response should contain the following values
      | name | New Board Updated!  |
      | desc | Description Updated |