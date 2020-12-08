Feature: Test POST, GET, PUT and DELETE without token

  Background: Sets authentication
    Given The user sets authentication using only an API key

  @negative
  Scenario: Verify that is not possible to create a Organization without token
    When The user sends a POST "organization" request to "/organizations/" with the following Json data
    """
      {
        "displayName" : "New Organization!"
      }
    """
    Then Verifies response should have the "401" status code
    And Verifies response contains the following text value
    """
    unauthorized organization.
    """

  @negative @createOrganization @deleteOrganization
  Scenario: Verify that is not possible to obtain a Organization without token
    When The user sends a GET "organization" request to "/organizations/{id}"
    Then Verifies response should have the "401" status code
    And Verifies response contains the following text value
    """
    unauthorized organization.
    """

  @negative @createOrganization @deleteOrganization
  Scenario: Verify that is not possible to update a Organization without token
    When The user sends a PUT "organization" request to "/organizations/{id}" with the following Json data
    """
      {
        "displayName" : "new Organization Name"
      }
    """
    Then Verifies response should have the "401" status code
    And Verifies response contains the following text value
    """
    unauthorized organization.
    """

  @negative @createOrganization @deleteOrganization
  Scenario: Verify that is not possible to delete a Organization without token
    When The user sends a DELETE "organization" request to "/organizations/{id}"
    Then Verifies response should have the "401" status code
    And Verifies response contains the following text value
    """
    unauthorized organization.
    """