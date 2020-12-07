Feature: Put Checklist

  In order to update a Checklist in trello
  Authenticated as valid Trello API consumer

  Background: Sets authentication
    Given The user sets valid authentication to request

@functional @createBoard @createList @createCard @createChecklist @deleteBoard
  Scenario: Verify checklist is updated with minimum required parameters
    When The user sends a PUT "checklist" request to "/checklists/{id}" with the following Json data
      """
      {
        "name" : "New checklist Updated!",
      }
     """
    Then Verifies response should have the "200" status code


@negative
  Scenario: Verify board is updated with minimum required parameters
    When The user sends a PUT "checklist" request to "/checklists/badNumber" with the following Json data
      """
      {
        "name" : "New checklist Updated!",
      }
     """
    Then Verifies response should have the "400" status code
