Feature: Get Organization

  In order to obtain a Organization in trello
  Authenticated as valid Trello API consumer

  Background: Sets authentication
    Given The user sets valid authentication to request

  @createOrganization @deleteOrganization @smoke
  Scenario: Verify that is possible to obtain a single Organization
    When The user sends a GET "organization" request to "/organizations/{id}"
    Then Verifies response should have the "200" status code
    And Verifies the "board" response body should match with "organization/singleOrganizationSchema.json" JSON schema
    And Verifies the "board" response should contain the following values
      | id   | {id}   |
      | name | {name} |
      | desc | {desc} |

  @negative
  Scenario: Verify that is not possible obtain a single organization
    When The user sends a GET "organization" request to "/organizations/badNumber"
    Then Verifies response should have the "404" status code
