*** Settings ***
Library              Selenium2Library

*** Variables ***
${BROWSER}           chrome

*** Keywords ***
Open test browser
                     [Arguments]                      ${url}
                     Selenium2Library.Open browser    ${url}    ${BROWSER}
