Feature: Create Card
  In order to create a Card in trello
  Authenticated as valid Trello API consumer

  Background: Sets authentication
    Given The user sets valid authentication to request

  @createBoard @deleteBoard @createList @deleteList @functional
  Scenario: Verify Card is created with minimum required parameters
    When The user sends a POST "list" request to "/cards/" with the following Json data
      """
      {
        "name" :"cardTest",
        "idList" :"{id}"
      }
      """
    Then Verifies response should have the "200" status code
    And Verifies the "card" response body should match with "/card/messageResponse.json" JSON schema
    And Verifies the "card" response should contain the following values
      | name  | cardTest |

  @createBoard @deleteBoard @createList @deleteList @negative
  Scenario: Verify that is not possible to create a Card without idList
    When The user sends a POST "board" request to "/cards/" with the following Json data
      """
      {
        "name" :"cardTest",
        "idList" :""
      }
      """
    Then Verifies response should have the "400" status code

  @createBoard @deleteBoard @createList @deleteList @negative
  Scenario: Verify that is not possible to create a Card with invalid idList
    When The user sends a POST "list" request to "/cards/" with the following Json data
      """
      {
        "name" :"cardTest",
        "idList" :"invalidId"
      }
      """
    Then Verifies response should have the "400" status code

  @createBoard @deleteBoard @createList @deleteList @functional
  Scenario: Verify that is possible to create a Card without name
    When The user sends a POST "list" request to "/cards/" with the following Json data
      """
      {
        "idList" : "{id}"
      }
      """
    Then Verifies response should have the "200" status code
    And Verifies the "card" response body should match with "/card/messageResponse.json" JSON schema
    And Verifies the "card" response should contain the following values
      | id  | {id} |
