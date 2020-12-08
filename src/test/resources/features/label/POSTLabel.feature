Feature: Create Label
  In order to create a Label in trello
  Authenticated as valid Trello API consumer

  Background: Sets authentication
    Given The user sets valid authentication to request

  @createBoard @deleteBoard @functional
  Scenario: Verify Label is created with minimum required parameters
    When The user sends a POST "board" request to "/labels/" with the following Json data
      """
      {
        "name" :"labelTest",
        "color" :"black",
        "idBoard" :"{id}"
      }
      """
    Then Verifies response should have the "200" status code
    And Verifies the "label" response body should match with "/label/messageResponse.json" JSON schema
    And Verifies the "label" response should contain the following values
      | name  | labelTest |
      | color | black     |

  @createBoard @deleteBoard @negative
  Scenario: Verify that is not possible to create a Label without idBoard
    When The user sends a POST "board" request to "/labels/" with the following Json data
      """
      {
        "name" :"labelTest",
        "color" :"black"
      }
      """
    Then Verifies response should have the "400" status code
    And Verifies the "label" response body should match with "/label/errorResponse.json" JSON schema
    And Verifies the "label" response should contain the following values
      | message | Invalid id |
      | error   | ERROR      |

  @createBoard @deleteBoard @negative @skipScenario
  Scenario: Verify that is not possible to create a Label without name
    When The user sends a POST "board" request to "/labels/" with the following Json data
      """
      {
        "color" :"black",
        "idBoard" :"{id}"
      }
      """
    Then Verifies response should have the "400" status code
    And Verifies the "label" response body should match with "/label/errorResponse.json" JSON schema
    And Verifies the "label" response should contain the following values
      | message | Invalid name |
      | error   | ERROR        |

  @createBoard @deleteBoard @functional
  Scenario: Verify that is possible to create a Label without color
    When The user sends a POST "board" request to "/labels/" with the following Json data
      """
      {
        "name" :"labelTest",
        "idBoard" :"{id}"
      }
      """
    Then Verifies response should have the "200" status code
    And Verifies the "label" response body should match with "/label/messageResponse.json" JSON schema
    And Verifies the "label" response should contain the following values
      | name  | labelTest |

  @createBoard @deleteBoard @functional
  Scenario: Verify that is possible to create a Label with numbers in its name
    When The user sends a POST "board" request to "/labels/" with the following Json data
      """
      {
        "name" :"labelTest 1",
        "idBoard" :"{id}"
      }
      """
    Then Verifies response should have the "200" status code
    And Verifies the "label" response body should match with "/label/messageResponse.json" JSON schema
    And Verifies the "label" response should contain the following values
      | name  | labelTest 1 |

  @createBoard @deleteBoard @functional
  Scenario: Verify that is possible to create a Label with numbers special caracters in its name
    When The user sends a POST "board" request to "/labels/" with the following Json data
      """
      {
        "name" :"labelTest '1'",
        "idBoard" :"{id}"
      }
      """
    Then Verifies response should have the "200" status code
    And Verifies the "label" response body should match with "/label/messageResponse.json" JSON schema
    And Verifies the "label" response should contain the following values
      | name  | labelTest '1' |

  @createBoard @deleteBoard @negative
  Scenario: Verify that is not possible to create a Label with invalid color
    When The user sends a POST "board" request to "/labels/" with the following Json data
      """
      {
        "name" :"labelTest",
        "color" :"brown",
        "idBoard" :"{id}"
      }
      """
    Then Verifies response should have the "400" status code
    And Verifies the "label" response body should match with "/label/errorResponse.json" JSON schema
    And Verifies the "label" response should contain the following values
      | message | invalid value for color |
      | error   | ERROR                   |

  @createBoard @deleteBoard @negative
  Scenario: Verify that is not possible to create a Label with invalid color
    When The user sends a POST "board" request to "/labels/" with the following Json data
      """
      {
        "name" :"labelTest",
        "color" :"brown",
        "idBoard" :"{id}"
      }
      """
    Then Verifies response should have the "400" status code
    And Verifies the "label" response body should match with "/label/errorResponse.json" JSON schema
    And Verifies the "label" response should contain the following values
      | message | invalid value for color |
      | error   | ERROR                   |

  @createBoard @deleteBoard @negative
  Scenario: Verify that is not possible to create a Label with invalid idBoard
    When The user sends a POST "board" request to "/labels/" with the following Json data
      """
      {
        "name" :"labelTest",
        "color" :"pink",
        "idBoard" :"invalidId"
      }
      """
    Then Verifies response should have the "400" status code
    And Verifies the "label" response body should match with "/label/errorResponse.json" JSON schema
    And Verifies the "label" response should contain the following values
      | message | Invalid id |
      | error   | ERROR      |

