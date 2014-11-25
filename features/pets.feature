Feature: Pets module

  Scenario: Register a pet to the site
    Given I'm a logged in user
    And I want to add a lost pet
    When I click "Registrar desaparición"
    And inserts an image
    And enter "Bobby" in the name field
    And select 'Hembra' in the sex field
    And select "Perro" in the animal type field
    And select "Zaguate" in the breed field
    And click "Aceptar y continuar" button to finish
    Then I will see the lost report form page
