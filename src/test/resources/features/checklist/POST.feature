Feature: Create Checklist

  In order to create a checklist in trello
  Authenticated as valid Trello API consumer

  Background: Sets authentication
    Given The user sets valid authentication to request

  @functional @createBoard @createList @createCard @deleteBoard
  Scenario: Verify checklist is created with minimum required parameters
    When The user sends a POST "card" request to "/checklists" with the following Json data
      """
      {
        "name" : "New checklist!",
        "idCard" : "{id}"
      }
     """
    Then Verifies response should have the "200" status code


  @negative
  Scenario: Verify checklist is not possible to create a checklist with a wrong idCard
    When The user sends a POST "checklist" request to "/checklists" with the following Json data
      """
      {
        "name" : "New checklist!",
        "idCard" : "-1"
      }
     """
    Then Verifies response should have the "400" status code
