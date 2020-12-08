Feature: Get Checklist

  In order to obtain a board in trello
  Authenticated as valid Trello API consumer

  Background: Sets authentication
    Given The user sets valid authentication to request

  @createBoard @createList @createCard @createChecklist @deleteCard @deleteList @deleteBoard @functional @smoke
  Scenario: Verify that is possible to retrieve all checklist as list
    When The user sends a GET "card" request to "/cards/{id}/checklists"
    Then Verifies response should have the "200" status code

  @createBoard @createList @createCard @createChecklist @deleteChecklist @deleteCard @deleteList @deleteBoard @functional
  Scenario: Verify is possible to obtain a checklist
    When The user sends a GET "checklist" request to "/checklists/{id}"
    Then Verifies response should have the "200" status code
    And Verifies the "checklist" response body should match with "checklist/messageResponse.json" JSON schema
    And Verifies the "checklist" response should contain the following values
      | name | {name} |

  @createBoard @createList @deleteList @createCard @createChecklist @deleteCheckList @deleteCard @deleteBoard @functional
  Scenario: Verify is not possible to obtain a checklist with invalid id
    When The user sends a GET "checklist" request to "/checklists/invalidId"
    Then Verifies response should have the "400" status code
