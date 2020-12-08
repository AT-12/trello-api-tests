Feature: Test POST, GET, PUT and DELETE without token

  Background: Sets authentication
    Given The user sets authentication using only an API token

  @negative @createBoard @deleteBoard @createList @deleteList
  Scenario: Verify that is not possible to create a Card without key
    When The user sends a POST "card" request to "/cards/" with the following Json data
    """
      {
        "name" : "New Card!",
        "idList" :"{id}"
      }
    """
    Then Verifies response should have the "401" status code
    And Verifies response contains the following text value
    """
    invalid key
    """

  @negative @createBoard @createList @createCard @deleteCard @deleteList @deleteBoard @skipScenario
  Scenario: Verify that is not possible to obtain a Card without key
    When The user sends a GET "card" request to "/cards/{id}"
    Then Verifies response should have the "401" status code
    And Verifies response contains the following text value
    """
    invalid key
    """

  @negative @createBoard @createList @createCard @deleteCard @deleteList @deleteBoard
  Scenario: Verify that is not possible to update a Card without key
    When The user sends a PUT "card" request to "/cards/{id}" with the following Json data
    """
      {
        "name" : "newCardName",
        "desc" : "newDescription"
      }
    """
    Then Verifies response should have the "401" status code
    And Verifies response contains the following text value
    """
    invalid key
    """

  @negative @createBoard @createList @createCard @deleteCard @deleteList @deleteBoard
  Scenario: Verify that is not possible to delete a Card without key
    When The user sends a DELETE "card" request to "/cards/{id}"
    Then Verifies response should have the "401" status code
    And Verifies response contains the following text value
    """
    invalid key
    """