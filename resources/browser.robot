*** Settings ***
Library               Selenium2Library

*** Variables ***
${BROWSER}            chrome

*** Keywords ***
Open test browser
                      [Arguments]                       ${URL}
                      Selenium2Library.Open browser     ${URL}    ${BROWSER}
Close test browser
                      Selenium2Library.Close browser