Feature: Put Checklist

  In order to update a Checklist in trello
  Authenticated as valid Trello API consumer

  Background: Sets authentication
    Given The user sets valid authentication to request

  @createBoard @createList @createCard @createChecklist @deleteChecklist @deleteCard @deleteList @deleteBoard @functional
  Scenario: Verify checklist is updated with minimum required parameters
    When The user sends a PUT "checklist" request to "/checklists/{id}" with the following Json data
      """
      {
        "name" : "New checklist Updated!"
      }
     """
    Then Verifies response should have the "200" status code
    And Verifies the "checklist" response body should match with "checklist/messageResponse.json" JSON schema
    And Verifies the "checklist" response should contain the following values
      | name | {name} |

  @createBoard @createList @createCard @createChecklist @deleteChecklist @deleteCard @deleteList @deleteBoard @negative
  Scenario: Verify that is not possible to update the checklist information with empty values
    When The user sends a PUT "checklist" request to "/checklists/{id}" with the following Json data
      """
      {
        "name" : ""
      }
     """
    Then Verifies response should have the "400" status code

  @createBoard @createList @createCard @createChecklist @deleteChecklist @deleteCard @deleteList @deleteBoard @functional
  Scenario: Verify that is possible to update the checklist information with name with blank spaces
    When The user sends a PUT "checklist" request to "/checklists/{id}" with the following Json data
      """
      {
        "name" : " "
      }
     """
    Then Verifies response should have the "200" status code
    And Verifies the "checklist" response body should match with "checklist/messageResponse.json" JSON schema
    And Verifies the "checklist" response should contain the following values
      | name | {name} |

  @createBoard @createList @createCard @createChecklist @deleteChecklist @deleteCard @deleteList @deleteBoard @functional
  Scenario: Verify that is possible to update the checklist position
    When The user sends a PUT "checklist" request to "/checklists/{id}" with the following Json data
      """
      {
        "name" : "new name",
        "pos" : 12
      }
     """
    Then Verifies response should have the "200" status code
    And Verifies the "checklist" response body should match with "checklist/messageResponse.json" JSON schema
    And Verifies the "checklist" response should contain the following values
      | name | {name} |
      | pos  | {pos}  |

  @createBoard @createList @createCard @createChecklist @deleteChecklist @deleteCard @deleteList @deleteBoard @negative
  Scenario: Verify that is not possible to update the checklist position with negatives numbers
    When The user sends a PUT "checklist" request to "/checklists/{id}" with the following Json data
      """
      {
        "name" : "new name",
        "pos" : -12
      }
     """
    Then Verifies response should have the "400" status code


  @negative
  Scenario: Verify that is not possible to update checklist using a invalid id
    When The user sends a PUT "checklist" request to "/checklists/badNumber" with the following Json data
      """
      {
        "name" : "New checklist Updated!",
      }
     """
    Then Verifies response should have the "400" status code
