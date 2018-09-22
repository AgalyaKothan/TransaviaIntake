Feature: Transavia Home Page

  Scenario Outline: Currency and Country Selection
    Given user is at transavia homepage
    When user selects the <currency> and <country>
    Then selected <currency> should be displayed
    And webpage <text> should be displayed in selected country's native language
    And weblinks should be displayed in selected country's <native language>

    Examples:
      | currency | country        | text                       | native language |
      | £ GBP    | United Kingdom | Where do you want to go?   | english         |
      | € EUR    | Nederland      | Waar wil je heen?          | dutch           |
      | $ USD    | Other country  | Where do you want to go?   | english         |
      | € EUR    | Portugal       | Para onde pretende viajar? | portuguese      |
      | € EUR    | France         | Où voulez-vous aller ?     | french          |

  Scenario Outline: Currency display based on country
    Given user is at transavia homepage
    When user selects the <country>
    And clicks on the currency link
    Then user should see the text <select currency> and <description>
    And user should see the links £ GBP, € EUR, $ USD

    Examples:
      | country        | select currency             | description                                                                  |
      | United Kingdom | select currency             | The ticket price shown is an indication. You will be paying in euros.        |
      | Italia         | Visualizza nella tua valuta | Il prezzo del biglietto è indicativo e il pagamento sarà effettuato in euro. |
      | Deutschland    | In Ihrer Währung anzeigen   | Der Ticketpreis ist eine Indikation. Sie bezahlen in Euro.                   |

  Scenario Outline: Check country options available
    Given user is at transavia homepage
    When user selects the <country>
    And clicks on the <country> link
    Then user should see the text <select country> and list of available countries

    Examples:
      | country    | select country              |
      | Italia     | Seleziona il tuo paese:     |
      | Nederlands | Please select your country: |
      | Espana     | Selecciona el país:         |

  Scenario: Validate passenger listbox
    Given user is at transavia homepage
    When user clicks on the passenger link
    Then user should see the text "Adults", ">11 years"
    And user should see the text "Children", "2-11 years"
    And user should see the text "Babies", "<2 years"
    And user should see the save button

  Scenario Outline: Choose Passenger
    Given user is at transavia homepage
    When selects the number of <adults>, <children> and <baby>
    Then added <passengers> should be saved

    Examples:
      | adults | children | baby | passengers                     |
      | 2      | 1        | 0    | 2 Adults and 1 child           |
      | 1      | 0        | 1    | 1 Adult and 1 baby             |
      | 2      | 2        | 0    | 2 Adults and 2 children        |
      | 2      | 2        | 1    | 2 Adults,2 children and 1 baby |


