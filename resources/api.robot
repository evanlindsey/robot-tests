*** Settings ***


*** Variables ***
${API}               https://api.github.com

*** Keywords ***
Get API
                     [Return]                  ${API}
