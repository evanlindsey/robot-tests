*** Settings ***
Resource                  pages.robot

*** Variables ***
${URL}                    https://github.com
${OVERVIEW_TAB}           //*[@id=\"js-pjax-container\"]/div/div[2]/div[2]/nav/a[1]
${REPOSITORIES_TAB}       //*[@id=\"js-pjax-container\"]/div/div[2]/div[2]/nav/a[2]
${STARS_TAB}              //*[@id=\"js-pjax-container\"]/div/div[2]/div[2]/nav/a[3]
${FOLLOWERS_TAB}          //*[@id=\"js-pjax-container\"]/div/div[2]/div[2]/nav/a[4]
${FOLLOWING_TAB}          //*[@id=\"js-pjax-container\"]/div/div[2]/div[2]/nav/a[5]

*** Keywords ***
Get URL
                          [Return]                                                     ${URL}
Get user page
                          [Arguments]                                                  ${user}
                          [Return]                                                     ${URL}/${user}
Get avatar source
                          ${avatar} =                                                  Selenium2Library.Get element attribute    class: avatar    src
                          Log to console                                               ${avatar}
Click repositories tab
                          Selenium2Library.Click element                               xpath: ${REPOSITORIES_TAB}
