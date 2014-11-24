Feature: Lost reports module

  Scenario: Fill the pet's lost report
    Given I'm a logged in user
    When I am on the page for add the information of the lost
    And enter "Pedro Soto" in the owner's name field
    And enter "88776655" in the phone field
    And select 'Alajuela' in the province select
    And enter "Cerca de la Iglesia de la Garita" in the address field
    And enter "Ocupa medicamentos urgentemente" in the description field
    And select 'Ofrezco recompensa' checkbox option
    And click "Ayudar a difundir por redes sociales" button
    Then I will be redirected to the lost report page
