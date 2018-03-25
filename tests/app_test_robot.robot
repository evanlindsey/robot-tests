*** Settings ***
Resource                            ../resources/pages/github_page.robot
Test Teardown                       browser.Close test browser

*** Variables ***
${USER}                             evanlindsey

*** Test Cases ***
Test Stuff
                                    Given browser is opened to github page
                                    Then github page should be open
                                    Then profile avatar should exist
                                    When repositories tab is clicked
                                    Then repositories tab should be open

*** Keywords ***
Browser is opened to github page
                                    ${BASE_URL} =                             github_page.Get URL
                                    pages.Go to page                          ${BASE_URL}${USER}
Github page should be open
                                    pages.Is page open                        ${USER}
Profile avatar should exist
                                    github_page.Get avatar source
Repositories tab is clicked
                                    github_page.Click repositories tab
Repositories tab should be open
                                    pages.Is page open                        Repositories
