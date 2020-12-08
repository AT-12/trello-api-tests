Feature: Get Label
  In order to get a Label in trello
  Authenticated as valid Trello API consumer

  Background: Sets authentication
    Given The user sets valid authentication to request

  @createBoard @createLabel @deleteBoard @functional @smoke
  Scenario: Verify is possible to obtain a label
    When The user sends a GET "label" request to "/labels/{id}"
    Then Verifies response should have the "200" status code
    And Verifies the "label" response body should match with "/label/messageResponse.json" JSON schema
    And Verifies the "label" response should contain the following values
      | name  | {name}  |
      | color | {color} |

  @createBoard @createLabel @deleteBoard @functional @skipScenario
  Scenario: Verify is not possible to obtain a label with invalid id
    When The user sends a GET "label" request to "/labels/invalidId"
    Then Verifies response should have the "400" status code
    And Verifies the "label" response body should match with "/label/errorResponse.json" JSON schema
    And Verifies the "label" response should contain the following values
      | message | Invalid id |
      | error   | ERROR      |
