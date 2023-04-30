*** Settings ***
Library    SeleniumLibrary
Documentation    Suite description #automated test for scout website

*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}      Chrome
${SIGNINBUTTON}     xpath=//*[contains(@class, 'MuiButton-label')]
${LANGUAGESELECTOR}     xpath=//div[2]/div/div
${ENGVERSION}       xpath=//li[1]
${PLVERSION}        xpath=//li[2]

*** Test Cases ***
Change language on the login page
    Open login page
    Click on the language selector
    Click on English language
    Click on the language selector
    Click on Polish language
    Assert Sign in button in login page
    [Teardown]    Close Browser

*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    Scouts panel - sign in
Click on the language selector
    Click Element    ${LANGUAGESELECTOR}
Click on English language
    Click Element   ${ENGVERSION}
Click on Polish language
    Click Element    ${PLVERSION}
Assert Sign in button in login page
    Element Text Should Be    ${SIGNINBUTTON}   SIGN IN
    Capture Page Screenshot    alert.png
