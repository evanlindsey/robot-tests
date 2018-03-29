*** Settings ***
Resource                                  ../resources/pages/github_page.robot
Resource                                  ../resources/api/github_api.robot
Variables                                 ../data/variables.py
Test Teardown                             Selenium2Library.Close all browsers

*** Variables ***


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
                                          ${user_url} =                                  github_page.Get user page        ${USER}
                                          pages.Go to page                               ${user_url}
Github page should be open
                                          pages.Is page open                             ${USER}
Profile avatar should exist
                                          github_page.Get avatar source
Repositories tab is clicked
                                          github_page.Click repositories tab
Repositories tab should be open
                                          pages.Is page open                             Repositories

Session is created with API base
                                          ${base_api} =                                  github_api.Get API
                                          api.Create Session at API base                 ${base_api}
Request is made to endpoint
                                          ${users_endpoint} =                            github_api.Get users endpoint    ${USER}
                                          api.Make request to endpoint                   ${users_endpoint}
Response should be 200
                                          api.Is response 200
Response data should contain user name
                                          api.Does response contain value                ${USER}
