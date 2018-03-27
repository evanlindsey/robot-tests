*** Settings ***
Resource              api.robot

*** Variables ***
${API}                https://api.github.com

*** Keywords ***
Get API
                      [Return]                  ${API}
Get users endpoint
                      [Arguments]               ${user}
                      [Return]                  /users/${user}
