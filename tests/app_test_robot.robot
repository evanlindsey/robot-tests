*** Settings ***
Library                                   Collections
Library                                   RequestsLibrary
Resource                                  ../resources/pages/github_page.robot
Resource                                  ../resources/api.robot
Test Teardown                             Selenium2Library.Close all browsers

*** Variables ***
${USER}                                   evanlindsey
${RESP}                                   None

*** Test Cases ***
Test Stuff
                                          Given browser is opened to github page

                                          Then github page should be open
                                          And profile avatar should exist

                                          When repositories tab is clicked

                                          Then repositories tab should be open

Get Requests
                                          Given session is created with endpoint

                                          When request is made to endpoint

                                          Then response should be 200
                                          And response data should contain user name

*** Keywords ***
Browser is opened to github page
                                          ${base_url} =                                 github_page.Get URL
                                          pages.Go to page                              ${base_url}/${USER}
Github page should be open
                                          pages.Is page open                            ${USER}
Profile avatar should exist
                                          github_page.Get avatar source
Repositories tab is clicked
                                          github_page.Click repositories tab
Repositories tab should be open
                                          pages.Is page open                            Repositories

Session is created with endpoint
                                          ${base_api} =                                 api.Get API
                                          Create Session                                github                 ${base_api}
Request is made to endpoint
                                          ${resp} =                                     Get Request            github         /users/${USER}
                                          Set Test Variable                             ${RESP}                ${resp}
Response should be 200
                                          Should Be Equal As Strings                    ${RESP.status_code}    200
Response data should contain user name
                                          Dictionary Should Contain Value               ${RESP.json()}         ${USER}
