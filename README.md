# trello-api-tests
Trello API tests

[![Build Status](https://travis-ci.com/AT-12/trello-api-tests.svg?branch=develop)](https://travis-ci.com/AT-12/trello-api-tests) 

[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=AT-12_trello-api-tests&metric=alert_status)](https://sonarcloud.io/dashboard/index/AT-12_trello-api-tests)
# Description
This is the AT-12's project, it was made on API Testing subject. 
The proposal of this project is to implement Web API testing applying BDD with Gherkin.
# Environment setup
Create an account on https://www.trello.com and set the following variables on gradle.properties.
- set baseUrl = https://api.trello.com/1
- set key = (your key)
- set token = (your token)
- set schemasPath = src/test/resources/schemas/
- set filterTags = (your filter tags)
- templatesPath=src/test/resources/templates
- set cucumberThreadCount = (the number of threads)

# Execute tests
In order to execute the tests there are the followings commands:

- gradle check
- gradle checkstyleMain
- gradle test
- gradle executeBDDTests
- gradle reExecuteBDDTests
# Endpoints tested
The endpoints tested are:

Board

- POST /boards/
- GET /boards/{id}
- DELETE /boards/{id} 
- PUT /boards/{id}

Organization

- POST /organizations/
- GET /organizations/{id}
- DELETE /organizations/{id} 
- PUT /organizations/{id}

Label

- POST /labels/
- GET /labels/{id}
- DELETE /labels/{id} 
- PUT /labels/{id}

Card

- POST /cards/
- GET /cards/{id}
- DELETE /cards/{id} 
- PUT /cards/{id}