Feature: Update Organization

  In order to update a organization in trello
  Authenticated as valid Trello API consumer

  Background: Sets authentication
    Given The user sets valid authentication to request

  @functional @createOrganization @deleteOrganization
  Scenario: Verify board is updated with minimum required parameters
    When The user sends a PUT "organization" request to "/organizations/{id}" with the following Json data
      """
      {
        "displayName" : "Organization Updated!",
        "desc" : "Description Updated"
      }
     """
    Then Verifies response should have the "200" status code
    And Verifies the "organization" response body should match with "organization/updateOrganizationSchema.json" JSON schema
    And Verifies the "organization" response should contain the following values
      | displayName | Organization Updated! |
      | desc        | Description Updated   |

  @negative @createOrganization @deleteOrganization
  Scenario: Verify organization is not possible updated with with a wrong JSON
    When The user sends a PUT "organization" request to "/organizations/{id}" with the following Json data
      """
      {
        "nameBad" : "Bad Organization!"
      }
     """
    Then Verifies response should have the "200" status code
    And Verifies the "organization" response body should match with "organization/updateOrganizationSchema.json" JSON schema
    And Verifies the "organization" response should contain the following values
      | displayName | New Organization |
