*** Settings ***
Library     SeleniumLibrary
Resource    ../../Resources/web-version/web_resources.robot
Variables    ../../Resources/web-version/web_variables.py


*** Test Cases ***
As Admin I can login as Admin Role on Talent Connect to Remove Test Item
    Login Into TalentConnect    url=${url}   browser=${browser}    email=${email_admin}    password=${password}    assertion_text=Admin

# As Admin I can remove target program
#     Remove Program TalentConnect    program_title=Automation Title    exclude_program_title=Joging

# As Admin I can remove evaluation aspect
#     Remove Evaluation Aspect

# As Admin I can remove evaluation category
#     Remove Evaluation Category

As Admin I can perform Logout
    Click Logout Button