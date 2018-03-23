*** Settings ***
Resource             ../browser.robot

*** Variables ***


*** Keywords ***
Go to page
                     [Arguments]                            ${URL}
                     browser.Open test browser              ${URL}
Is page open
                     [Arguments]                            ${TERM}
                     Selenium2Library.Wait for condition    return document.title.includes('${TERM}')    5 seconds
