Feature: Test POST, GET, PUT and DELETE without key

  Background: Sets authentication
    Given The user sets authentication using only an API token

  @negative @createBoard @deleteBoard
  Scenario: Verify that is not possible to create a Board without key
    When The user sends a POST "board" request to "/boards/" with the following Json data
    """
      {
        "name" : "testBoard",
        "desc" : "Description"
      }
    """
    Then Verifies response should have the "401" status code
    And Verifies response contains the following text value
    """
    invalid key
    """

  @negative @createBoard @deleteBoard @skipScenario
  Scenario: Verify that is not possible to obtain a Board without key
    When The user sends a GET "board" request to "/boards/{id}"
    Then Verifies response should have the "401" status code
    And Verifies response contains the following text value
    """
    invalid key
    """

  @negative @createBoard @deleteBoard
  Scenario: Verify that is not possible to update a Board without key
    When The user sends a PUT "board" request to "/boards/{id}" with the following Json data
    """
      {
        "name" : "newBoardName",
        "desc" : "newDescription"
      }
    """
    Then Verifies response should have the "401" status code
    And Verifies response contains the following text value
    """
    invalid key
    """

  @negative @createBoard @deleteBoard
  Scenario: Verify that is not possible to delete a Board without key
    When The user sends a DELETE "board" request to "/boards/{id}"
    Then Verifies response should have the "401" status code
    And Verifies response contains the following text value
    """
    invalid key
    """