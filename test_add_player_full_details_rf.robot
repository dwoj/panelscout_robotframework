*** Settings ***
Library    SeleniumLibrary
Documentation    Suite description #automated test for scout website

*** Variables ***
${LOGIN URL}        https://scouts.futbolkolektyw.pl/en/
${BROWSER}      Chrome
${SIGNINBUTTON}     xpath=//*[contains(@class, 'MuiButton-label')]
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${PAGELOGO}     xpath=//div[3]/div[1]/div/div[1]
${ADDPLAYERBUTTON}      xpath=//div[2]/div/div/a/button/span[1]
${NAMEINPUT}        xpath=//div[2]/div/div/input
${SURNAMEINPUT}     xpath=//div[3]/div/div/input
${AGEINPUT}     xpath=//div[7]/div/div/input
${LEGFIELD}     xpath=//*[@id='mui-component-select-leg']
${RIGHTLEGOPTION}   xpath=//li[1]
${MAINPOSITIONINPUT}    xpath=//div[11]/div/div/input
${SUBMITBUTTON}     xpath=//div[3]/button[1]/span[1]
${MAINPAGEBUTTON}   xpath=//ul[1]/div[1]
${LASTCREATEDPLAYERBUTTON}  xpath=//div[3]/div/div/a[1]/button/span[1]

*** Test Cases ***
Add new player
    Open login page
    Type in email
    Type in password
    Click on the Sign in button
    Click on the Add player button
    Type in Name
    Type in Surname
    Type in Age
    Click on the Leg field
    Click on right leg option
    Type in Main position
    Click on the Submit button
    Click on the Main page button
    Assert created player
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
Click on the Add player button
    Wait Until Element Is Visible    ${PAGELOGO}
    Click Element   ${ADDPLAYERBUTTON}
Type in Name
    Wait Until Element Is Visible    ${NAMEINPUT}
    Input Text      ${NAMEINPUT}        Jan
Type in Surname
    Input Text      ${SURNAMEINPUT}     Nowak
Type in Age
    Input Text      ${AGEINPUT}     01-03-2003
Click on the Leg field
    Click Element    ${LEGFIELD}
Click on right leg option
    Click Element   ${RIGHTLEGOPTION}
Type in Main position
    Input Text    ${MAINPOSITIONINPUT}      goalkeeper
Click on the Submit button
    Click Element       ${SUBMITBUTTON}
    Sleep   7
Click on the Main page button
    Click Element    ${MAINPAGEBUTTON}
Assert created player
    Wait Until Element Is Visible    ${PAGELOGO}
    Element Text Should Be      ${LASTCREATEDPLAYERBUTTON}  JAN NOWAK


