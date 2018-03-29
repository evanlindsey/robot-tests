*** Settings ***
Library                                   Selenium2Library
Library                                   RequestsLibrary
Library                                   ../modules/GitHubPage.py
Library                                   ../modules/GitHubAPI.py
Variables                                 ../data/variables.py
Test Teardown                             Selenium2Library.Close all browsers

*** Variables ***
${RESP}                                   ${None}

*** Test Cases ***
Test Stuff
                                          Given browser is opened to user github page

                                          Then github page should be open
                                          And profile avatar should exist

                                          When repositories tab is clicked

                                          Then repositories tab should be open

Get Requests
                                          Given session is created with API base

                                          When request is made to endpoint

                                          Then response should be 200
                                          And response data should contain user name

*** Keywords ***
Browser is opened to user github page
                                          ${user_url} =                                  GitHubPage.Get user page              ${USER}
                                          GitHubPage.Go to page                          ${user_url}
Github page should be open
                                          GitHubPage.Is page open                        ${USER}
Profile avatar should exist
                                          GitHubPage.Get avatar source
Repositories tab is clicked
                                          GitHubPage.Click repositories tab
Repositories tab should be open
                                          GitHubPage.Is page open                        Repositories

Session is created with API base
                                          ${base_api} =                                  GitHubAPI.Get API
                                          GitHubAPI.Create Session at API base           ${base_api}
Request is made to endpoint
                                          ${user_endpoint} =                             GitHubAPI.Get user endpoint           ${USER}
                                          ${RESP} =                                      GitHubAPI.Make request to endpoint    ${user_endpoint}
                                          Set Test Variable                              ${RESP}
Response should be 200
                                          GitHubAPI.Is response 200                      ${RESP}
Response data should contain user name
                                          GitHubAPI.Does response contain value          ${RESP}                               ${USER}
