*** Settings ***
Library     SeleniumLibrary
Library    DateTime
Resource    ../../Resources/web-version/web_resources.robot
Variables    ../../Resources/web-version/web_variables.py


*** Test Cases ***
As Judge I can login as Judge Role on Talent Connect
    Login Into TalentConnect    url=${url}    email=${email_judge}    password=${password}    assertion_text=Judge

As Judge I can view the detail of program
    Judge View Detail Program  

As Judge I can view Mentee who have not evaluated
    Wait Until Page Contains    Mentee 1

As Judge I can evaluate on Mid Evaluation
    Judge Evaluate Mid Evaluation

As Judge I can evaluate on Final Evaluation
    Jugde Evaluate Final Evaluation

As Judge I can view result of Mid Evaluation
    Judge View Result Mid Evaluation

As Judge I can view result of Final Evaluation
    Judge View Result Final Evaluation

As Judge I can perform Logout
    Click Logout Button