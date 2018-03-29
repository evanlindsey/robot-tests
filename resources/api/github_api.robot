*** Settings ***
Resource              api.robot

*** Variables ***
${API_URL}            https://api.github.com

*** Keywords ***
Get API
                      [Return]                  ${API_URL}
Get user endpoint
                      [Arguments]               ${user}
                      [Return]                  /users/${user}
