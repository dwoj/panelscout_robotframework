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
${LANGUAGEBUTTON}     xpath=//ul[2]/div[1]/div[2]/span
${MAINPAGEBUTTON}       xpath=//ul[1]/div[1]/div[2]/span

*** Test Cases ***
Change language in dashboard
    Open login page
    Type in email
    Type in password
    Click on the Sign in button
    Click on language selector
    Assert main page title
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
Click on language selector
    Wait Until Element Is Visible    ${PAGELOGO}
    Click Element    ${LANGUAGEBUTTON}
Assert main page title
    Element Text Should Be    ${MAINPAGEBUTTON}   Strona główna
    Capture Page Screenshot    alert.png

