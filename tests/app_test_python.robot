*** Settings ***
Library                                  Selenium2Library
Library                                  ../modules/GitHubPage.py
Test Teardown                            Selenium2Library.Close all browsers

*** Variables ***
${USER}                                  evanlindsey

*** Test Cases ***
Test Stuff
                                         Given browser is opened to user github page

                                         Then github page should be open
                                         And profile avatar should exist

                                         When repositories tab is clicked

                                         Then repositories tab should be open

*** Keywords ***
Browser is opened to user github page
                                         ${base_url} =                                  GitHubPage.Get URL
                                         GitHubPage.Go to page                          ${base_url}/${USER}
Github page should be open
                                         GitHubPage.Is page open                        ${USER}
Profile avatar should exist
                                         GitHubPage.Get avatar source
Repositories tab is clicked
                                         GitHubPage.Click repositories tab
Repositories tab should be open
                                         GitHubPage.Is page open                        Repositories
