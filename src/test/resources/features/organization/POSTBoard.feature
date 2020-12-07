Feature: Create Organization

  In order to create a organization in trello
  Authenticated as valid Trello API consumer

  Background: Sets authentication
    Given The user sets valid authentication to request

  @functional @deleteOrganization
  Scenario: Verify board is created with minimum required parameters
    When The user sends a POST "organization" request to "/organizations" with the following Json data
      """
      {
        "displayName" : "New Organization"
      }
     """
    Then Verifies response should have the "200" status code
    And Verifies the "organization" response body should match with "organization/organizationSchema.json" JSON schema
    And Verifies the "organization" response should contain the following values
      | displayName | New Organization |

  @negative
  Scenario: Verify organization is not possible to create a organization with a wrong JSON
    When The user sends a POST "board" request to "/boards" with the following Json data
      """
      {
        "displayNameBad" : "New Organization Bad!"
      }
     """
    Then Verifies response should have the "400" status code
