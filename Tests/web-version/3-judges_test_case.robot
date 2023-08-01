*** Settings ***
Library     SeleniumLibrary
Library    DateTime
Resource    ../../Resources/web-version/web_resources.robot
Variables    ../../Resources/web-version/web_variables.py


*** Test Cases ***
As Judge I can login as Judge Role on Talent Connect
    Login Into TalentConnect    url=${url}    email=${email_judge}    password=${password}    assertion_text=Judge

As Judge I can view the detail of program
    Search bar on Program Page    target_text=Automation Title    exclude_text=Joging
    Sleep    1s
    Click Element    locator=${target_program}   

As Judge I can view Mentee who have not evaluated
    Wait Until Page Contains    Mentee 1

As Judge I can evaluate on Mid Evaluation
    Sleep    1s
    Click Element    //button[normalize-space()='Evaluate']
    Sleep    1s
    Wait Until Page Contains    Automation Aspect
    Sleep    2s
    Click Element    //*[@id="root"]/div[1]/div/div/div[2]/div/div/form/div[2]/div/div/div[5]//input[@type='radio']
    Sleep    2s
    Click Element    //button[normalize-space()='Add Evaluation']
    Sleep    1s

As Judge I can evaluate on Final Evaluation
    Sleep    1s
    Click Element    //h6[normalize-space()='Final Evaluation']
    Sleep    1s
    Click Element    //button[normalize-space()='Evaluate']
    Sleep    1s
    Wait Until Page Contains    Automation Aspect
    Sleep    2s
    Click Element    //*[@id="root"]/div[1]/div/div/div[2]/div/div/form/div[2]/div/div/div[5]//input[@type='radio']
    Sleep    2s
    Click Element    //button[normalize-space()='Add Evaluation']
    Sleep    2s


As Judge I can view result of Mid Evaluation
    Sleep    1s
    Click Element    //button[normalize-space()='Evaluate']
    Sleep    1s
    Wait Until Page Contains    Automation Category
    Wait Until Page Contains    Total Score
    Sleep    1s
    Click Element    //button[@type='submit']//h2//*[name()='svg']
    Sleep    1s

As Judge I can view result of Final Evaluation
    Sleep    1s
    Click Element    //h6[normalize-space()='Final Evaluation']
    Sleep    1s
    Click Element    //button[normalize-space()='Evaluate']
    Sleep    1s
    Wait Until Page Contains    Automation Category
    Wait Until Page Contains    Total Score
    Sleep    1s
    Click Element    //button[@type='submit']//h2//*[name()='svg']
    Sleep    1s

As Judge I can perform Logout
    Click Logout Button