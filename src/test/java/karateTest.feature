Feature: Crear y actualizar y borrar productos

  Background:
    * def baseUrl = 'http://a0debff70e25c4232aab99c8d72e4a5c-211042183.us-east-1.elb.amazonaws.com/api/v1/products'

  Scenario: Crear
    Given url baseUrl
    And request { "name": "Lionel Messi", "price": 100, "description": "best", "imagePath": "/image" }
    When method post
    Then status 201
    * def messiId = response.id

    Given url baseUrl
    And request { "name": "Cristiano Ronaldo", "price": 200, "description": "mejor", "imagePath": "/image" }
    When method post
    Then status 201
    * def ronaldoId = response.id


    Given url baseUrl
    And request { "name": "Neymar Jr.", "price": 300, "description": "bueno", "imagePath": "/image" }
    When method post
    Then status 201
    * def neymarId = response.id

Scenario: Actualizar
    Given url baseUrl
    And request {"id": "66f39dcbb521b03cd723278c","name": "nuevo valor","price": 1200,"description": "primo actualizado","imagePath": "/image"}
    When method put
    Then status 200

  Scenario: Crear Borrar
    Given url baseUrl
    And request { "name": "pablo marmol", "price": 777, "description": "picapiedra", "imagePath": "/image" }
    When method post
    Then status 201
    * def pabloId = response.id

    Given url baseUrl + '/' + pabloId
    When method delete
    Then status 200

 
    Given url baseUrl + '/' + pabloId
    When method get
    Then status 200
    * def responseBody = response
    * match responseBody == ''
