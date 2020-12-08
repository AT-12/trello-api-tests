Feature: Delete Checklist

  In order to delete a Checklist in trello
  Authenticated as valid Trello API consumer

  Background: Sets authentication
    Given The user sets valid authentication to request

  @createBoard @createList @createCard @createChecklist @deleteCard @deleteList @deleteBoard @functional
  Scenario: Verify is possible to delete a checklist
    When The user sends a DELETE "checklist" request to "/checklists/{id}"
    Then Verifies response should have the "200" status code
    When The user sends a GET "checklist" request to "/checklists/{id}"
    Then Verifies response should have the "404" status code

  @createBoard @createList @createCard @createChecklist @deleteChecklist @deleteCard @deleteList @deleteBoard @negative
  Scenario: Verify that is not possible delete a checklist using a invalid id
    When The user sends a DELETE "checklist" request to "/checklists/badNumber"
    Then Verifies response should have the "400" status code
