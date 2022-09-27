Feature: sample karate test script
  for help, see: https://github.com/karate/wiki/IDE-Support

  Background:
    # variable url
    #* url 'https://jsonplaceholder.typicode.com/'
    #the blue url cam from karate-config.js
    * url url

  @Ignore
  Scenario: get all users and then get first user by id
    # https://jsonplaceholder.typicode.com/users
    Given path 'users'
    When method get
    #Informational responses (100–199) #Successful responses (200–299) #Redirection messages (300–399) #Client error responses (400–499) #Server error responses (500–599)
    Then status 200
    # fist c'est le premier user
    * def first = response[0]
    # ecran # Action # Retour
    # https://jsonplaceholder.typicode.com/users/1
    Given path 'users', first.id
    When method get
    # contrat correct
    Then status 200

  @Ignore
  Scenario: create a user and then get it by id
    * def user =
    """
    {
      "name": "Leanne Graham",
      "username": "Bret",
      "email": "Sincere@april.biz",
      "address": {
        "street": "Kulas Light",
        "suite": "Apt. 556",
        "city": "Gwenborough",
        "zipcode": "92998-3874",
        "geo": {
          "lat": "-37.3159",
          "lng": "81.1496"
        }
      },
      "phone": "1-770-736-8031 x56442",
      "website": "hildegard.org",
      "company": {
        "name": "Romaguera-Crona",
        "catchPhrase": "Multi-layered client-server neural-net",
        "bs": "harness real-time e-markets"
      }
    }
    """
    # Given url "https://jsonplaceholder.typicode.com/users"
    Given path "users"
    # request: body
    And request user
    When method post
    Then status 201

    * def id = response.id
    * print 'created id is: ', id

    #Given path id
    Given path 'users', id
    #When method get
    #Then status 200
    #Add match response contains user
