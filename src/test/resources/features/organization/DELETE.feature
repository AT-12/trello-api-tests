Feature: Delete Organization

  In order to delete a organization in trello
  Authenticated as valid Trello API consumer

  Background: Sets authentication
    Given The user sets valid authentication to request

  @createOrganization @functional @deleteOrganization
  Scenario: Verify is possible to delete a board
    When The user sends a DELETE "organization" request to "/organizations/{id}"
    Then Verifies response should have the "200" status code
    When The user sends a GET "organization" request to "/organizations/{id}"
    Then Verifies response should have the "404" status code

  @negative
  Scenario: Verify that is not possible delete a board
    When The user sends a DELETE "organization" request to "/organizations/badNumber"
    Then Verifies response should have the "404" status code
