Feature: Put Board

  In order to update a board in trello
  Authenticated as valid Trello API consumer

  Background: Sets authentication
    Given The user sets valid authentication to request

@functional @createBoard @deleteBoard
  Scenario: Verify board is updated with minimum required parameters
    When The user sends a PUT "board" request to "/boards/{id}" with the following Json data
      """
      {
        "name" : "New Board Updated!",
        "desc" : "Description Updated"
      }
     """
    Then Verifies response should have the "200" status code
    And Verifies the "board" response body should match with "board/updateBoardSchema.json" JSON schema
    And Verifies the "board" response should contain the following values
      | name | New Board Updated!  |
      | desc | Description Updated |

@negative
  Scenario: Verify board is updated with minimum required parameters
    When The user sends a PUT "board" request to "/boards/badNumber" with the following Json data
      """
      {
        "name" : "New Board Updated!",
        "desc" : "Description Updated"
      }
     """
    Then Verifies response should have the "400" status code
