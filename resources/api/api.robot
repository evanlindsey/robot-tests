*** Settings ***
Library                        Collections
Library                        RequestsLibrary

*** Variables ***
${RESP}                        None

*** Keywords ***
Create session at API base
                               [Arguments]                        ${API}
                               RequestsLibrary.Create Session     base                   ${API}
Make request to endpoint
                               [Arguments]                        ${ENDPOINT}
                               ${resp} =                          Get Request            base       ${ENDPOINT}
                               Set Test Variable                  ${RESP}                ${resp}
Is response 200
                               Should Be Equal As Strings         ${RESP.status_code}    200
Does response contain value
                               [Arguments]                        ${VAL}
                               Dictionary Should Contain Value    ${RESP.json()}         ${VAL}
