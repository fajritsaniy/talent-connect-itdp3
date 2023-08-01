*** Settings ***
Library     SeleniumLibrary
Library    DateTime
Resource    ../../Resources/web-version/web_resources.robot
Variables    ../../Resources/web-version/web_variables.py


*** Test Cases ***
As Mentee I can login as Mentee Role on Talent Connect
    Login Into TalentConnect    url=${url}    email=${email_mentee}    password=${password}    assertion_text=Mentee

As Mentee I can view program page
    Search bar on Program Page    target_text=Automation Title    exclude_text=Joging
    Sleep    1s
    Click Element    locator=${target_program}

As Mentee I can view participant of program
    Sleep    1s
    Click Element    //div[@id='rc-tabs-0-tab-2']
    Sleep    1s

As Mentee I can Mid Evaluation result
    Click Element    //div[@id='rc-tabs-0-tab-3']
    Sleep    1s
    Click Element    //span[normalize-space()='Mid Evaluation']
    Wait Until Page Contains    Total Score

As Mentee I can Final Evaluation result
    Sleep    1s
    Click Element    //span[normalize-space()='Final Evaluation']
    Wait Until Page Contains    Total Score
    Sleep    1s

As Mentee I can view Upcoming Activities
    Move to Program Page
    Search bar on Program Page    target_text=Automation Title    exclude_text=Joging
    Sleep    1s
    Click Element    locator=${target_program}
    Sleep    1s

As Mentee I can view Pas Activities
    Click Element    //h5[normalize-space()='Past Activities']
    Sleep    1s
    Scroll into end of page

As Mentee I can view the detail of activity
    Sleep    1s
    Click Element    //h5[normalize-space()='Mentor Automation Activity']

As Mentee I can view feedback from mentor
    Sleep    1s
    Scroll into end of page
    Sleep    1s

As Mentee I can perform Logout
    Click Logout Button