Feature: Create Checklist

  In order to create a checklist in trello
  Authenticated as valid Trello API consumer

  Background: Sets authentication
    Given The user sets valid authentication to request

  @createBoard @deleteBoard @createList @deleteList @createCard @deleteCard @functional
  Scenario: Verify checklist is created with minimum required parameters
    When The user sends a POST "card" request to "/checklists/" with the following Json data
      """
      {
        "name" : "New checklist",
        "idCard" : "{id}"
      }
     """
    Then Verifies response should have the "200" status code
    And Verifies the "checklist" response should contain the following values
      | name | New checklist |

  @createBoard @deleteBoard @createList @deleteList @createCard @deleteCard @functional
  Scenario: Verify checklist is created without name
    When The user sends a POST "card" request to "/checklists/" with the following Json data
      """
      {
        "idCard" : "{id}"
      }
     """
    Then Verifies response should have the "200" status code

  @negative @createBoard @createList @createCard @deleteBoard
  Scenario: Verify checklist is not possible to create a checklist with a wrong idCard
    When The user sends a POST "card" request to "/checklists/" with the following Json data
      """
      {
        "name" : "New checklist",
        "idCard" : "-1"
      }
     """
    Then Verifies response should have the "400" status code

  @negative @createBoard @createList @createCard @deleteBoard
  Scenario: Verify checklist is not possible to create a checklist without a idCard
    When The user sends a POST "card" request to "/checklists/" with the following Json data
      """
      {
        "name" : "New checklist",
        "idCard" : ""
      }
     """
    Then Verifies response should have the "400" status code

  @createBoard @deleteBoard @createList @deleteList @createCard @deleteCard @functional
  Scenario: Verify that is possible to create checklist with name with special characters
    When The user sends a POST "card" request to "/checklists/" with the following Json data
      """
      {
        "name" : "New checklist--%",
        "idCard" : "{id}"
      }
     """
    Then Verifies response should have the "200" status code

  @createBoard @deleteBoard @createList @deleteList @createCard @deleteCard @functional
  Scenario: Verify that is possible to create checklist with position with positives numbers
    When The user sends a POST "card" request to "/checklists/" with the following Json data
      """
      {
        "name" : "New checklist--%",
        "idCard" : "{id}",
        "pos" : 123
      }
     """
    Then Verifies response should have the "200" status code
    And Verifies the "checklist" response body should match with "checklist/messageResponse.json" JSON schema
    And Verifies the "checklist" response should contain the following values
      | name | {name} |
      | pos  | {pos}  |

  @createBoard @deleteBoard @createList @deleteList @createCard @deleteCard @negative
  Scenario: Verify that is not possible to create checklist with position with negatives numbers
    When The user sends a POST "card" request to "/checklists/" with the following Json data
      """
      {
        "name" : "New checklist--%",
        "idCard" : "{id}",
        "pos" : -123
      }
     """
    Then Verifies response should have the "400" status code

  @createBoard @deleteBoard @createList @deleteList @createCard @deleteCard @functional
  Scenario: Verify that is possible to create checklist with position with top value
    When The user sends a POST "card" request to "/checklists/" with the following Json data
      """
      {
        "name" : "New checklist--%",
        "idCard" : "{id}",
        "pos" : "top"
      }
     """
    Then Verifies response should have the "200" status code
    And Verifies the "checklist" response body should match with "checklist/messageResponse.json" JSON schema
    And Verifies the "checklist" response should contain the following values
      | name | {name} |
      | pos  | {pos}  |