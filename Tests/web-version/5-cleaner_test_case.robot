*** Settings ***
Library     SeleniumLibrary
Resource    ../../Resources/web-version/web_resources.robot
Variables    ../../Resources/web-version/web_variables.py


*** Test Cases ***
As Admin I can login as Admin Role on Talent Connect to Remove Test Item
    Login Into TalentConnect    url=${url}    email=${email_admin}    password=${password}    assertion_text=Admin

As Admin I can view final result of Program
    Search bar on Program Page    target_text=Automation Title    exclude_text=Joging
    Click Element    locator=${target_program}
    Sleep    2s
    Click Element    locator=//div[@id='rc-tabs-0-tab-3']
    Wait Until Page Contains    Evaluation Progress

As Admin I can remove target program
    Remove Program TalentConnect    program_title=Automation Title    exclude_program_title=Joging

As Admin I can remove evaluation aspect
    Remove Evaluation Aspect

As Admin I can remove evaluation category
    Remove Evaluation Category

As Admin I can perform Logout
    Click Logout Button