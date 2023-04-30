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
${ADDPLAYERBUTTON}      xpath=//div[2]/div/div/a/button/span[1]
${NAMEINPUT}        xpath=//div[2]/div/div/input
${SURNAMEINPUT}     xpath=//div[3]/div/div/input
${AGEINPUT}     xpath=//div[7]/div/div/input
${MAINPOSITIONINPUT}    xpath=//div[11]/div/div/input
${CLEARBUTTON}     xpath=//button[2]/span[1]
${REQUIREDFIELDMESSAGE}     xpath=//div[11]/div/p

*** Test Cases ***
Type in new player data and click on clear button
    Open login page
    Type in email
    Type in password
    Click on the Sign in button
    Click on the Add player button
    Type in Name
    Type in Surname
    Type in Age
    Type in Main position
    Click on Clear button
    Assert required field
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
Type in Main position
    Input Text    ${MAINPOSITIONINPUT}      goalkeeper
Click on Clear button
    Click Element    ${CLEARBUTTON}
Assert required field
    Wait Until Element Is Visible    ${REQUIREDFIELDMESSAGE}
    Element Text Should Be      ${REQUIREDFIELDMESSAGE}  Required
    Capture Page Screenshot    alert.png


