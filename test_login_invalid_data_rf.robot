*** Settings ***
Library    SeleniumLibrary
Documentation    Suite description #automated test for scout website

*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}      Chrome
${SIGNINBUTTON}     xpath=//*[contains(@class, 'MuiButton-label')]
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${LOGININPUT}   xpath=//*[@id='login']

*** Test Cases ***
Login to the system with invalid data
    Open login page
    Type in email
    Type in password
    Click on the Sign in button
    Assert login page
    [Teardown]    Close Browser

*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    Scouts panel - sign in
Type in email
    Input Text    ${EMAILINPUT}     user01@getnada.com
Type in password
    Input Password    ${PASSWORDINPUT}      Test-12345678
Click on the Sign in button
    Click Element    ${SIGNINBUTTON}
Assert login page
    Wait Until Element Is Visible    ${LOGININPUT}
    Title Should Be    Scouts panel - sign in
    Capture Page Screenshot    alert.png

