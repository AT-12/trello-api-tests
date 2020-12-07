Feature: Update Label
  In order to update a Label in trello
  Authenticated as valid Trello API consumer

  Background: Sets authentication
    Given The user sets valid authentication to request

  @createBoard @createLabel @functional @deleteBoard
  Scenario: Verify is possible to update a label
    When The user sends a PUT "label" request to "/labels/{id}" with the following Json data
      """
      {
        "name" :"newLabelTest",
        "color" :"sky"
      }
      """
    Then Verifies response should have the "200" status code
    And Verifies the "label" response body should match with "/label/messageResponse.json" JSON schema
    And Verifies the "label" response should contain the following values
      | name  | newLabelTest |
      | color | sky          |

  @createBoard @createLabel @functional @deleteBoard
  Scenario: Verify is possible to update name field of label
    When The user sends a PUT "label" request to "/labels/{id}/name" with the following Json data
      """
      {
        "value" :"newLabelTest"
      }
      """
    Then Verifies response should have the "200" status code
    And Verifies the "label" response body should match with "/label/messageResponse.json" JSON schema
    And Verifies the "label" response should contain the following values
      | name  | newLabelTest |

  @createBoard @createLabel @deleteBoard @functional
  Scenario: Verify is possible to update color field of label
    When The user sends a PUT "label" request to "/labels/{id}/color" with the following Json data
      """
      {
        "value" :"pink"
      }
      """
    Then Verifies response should have the "200" status code
    And Verifies the "label" response body should match with "/label/messageResponse.json" JSON schema
    And Verifies the "label" response should contain the following values
      | color  | {color} |

  @createBoard @createLabel @deleteBoard @negative
  Scenario: Verify is not possible to update color field with invalid value
    When The user sends a PUT "label" request to "/labels/{id}/color" with the following Json data
      """
      {
        "value" :"brown"
      }
      """
    Then Verifies response should have the "400" status code
    And Verifies the "label" response body should match with "/label/errorResponse.json" JSON schema
    And Verifies the "label" response should contain the following values
      | message  | invalid value for value |
      | error    | ERROR                   |

  @createBoard @createLabel @deleteBoard @negative @skipScenario
  Scenario: Verify is not possible to update name field without value
    When The user sends a PUT "label" request to "/labels/{id}/name" with the following Json data
      """
      {
      }
      """
    Then Verifies response should have the "400" status code
    And Verifies the "label" response body should match with "/label/errorResponse.json" JSON schema
    And Verifies the "label" response should contain the following values
      | message  | invalid value for name |
      | error    | ERROR                  |

  @createBoard @createLabel @deleteBoard @functional
  Scenario: Verify is possible to update color field without value
    When The user sends a PUT "label" request to "/labels/{id}/color" with the following Json data
      """
      {
      }
      """
    Then Verifies response should have the "200" status code
    And Verifies the "label" response body should match with "/label/messageResponse.json" JSON schema
    And Verifies the "label" response should contain the following values
      | name  | {name} |
