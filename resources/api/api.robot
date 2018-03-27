*** Settings ***
Library                        Collections
Library                        RequestsLibrary

*** Variables ***
${RESP}                        ${None}

*** Keywords ***
Create session at API base
                               [Arguments]                        ${api}
                               RequestsLibrary.Create Session     base                           ${api}
Make request to endpoint
                               [Arguments]                        ${endpoint}
                               ${RESP} =                          RequestsLibrary.Get Request    base      ${endpoint}
                               Set Test Variable                  ${RESP}
Is response 200
                               Should Be Equal As Strings         ${RESP.status_code}            200
Does response contain value
                               [Arguments]                        ${val}
                               Dictionary Should Contain Value    ${RESP.json()}                 ${val}
