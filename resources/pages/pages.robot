*** Settings ***
Resource             ../browser.robot

*** Variables ***


*** Keywords ***
Go to page
                     [Arguments]                            ${url}
                     browser.Open test browser              ${url}
Is page open
                     [Arguments]                            ${term}
                     Selenium2Library.Wait for condition    return document.title.includes('${term}')    5 seconds
