*** Settings ***
Library    SeleniumLibrary
Documentation    Suite description #automated test for scout website

*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}      Chrome
${SIGNINBUTTON}     xpath=//*[contains(@class, 'MuiButton-label')]
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${PAGELOGO}     xpath=//div[3]/div[1]/div/div[1]
${SIGNOUTBUTTON}    xpath=//ul[2]/div[2]/div[2]/span

*** Test Cases ***
Login to the system and logout
    Open login page
    Type in email
    Type in password
    Click on the Sign in button
    Click on the Sign out button
    Assert main title login page
    [Teardown]    Close Browser

*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    Scouts panel - sign in
Type in email
    Input Text    ${EMAILINPUT}     user01@getnada.com
Type in password
    Input Password    ${PASSWORDINPUT}      Test-1234
Click on the Sign in button
    Click Element    ${SIGNINBUTTON}
Click on the Sign out button
    Wait Until Element Is Visible    ${PAGELOGO}
    Click Element    ${SIGNOUTBUTTON}
Assert main title login page
    Wait Until Element Is Visible    ${EMAILINPUT}
    Title Should Be    Scouts panel - sign in
    Capture Page Screenshot    alert.png
