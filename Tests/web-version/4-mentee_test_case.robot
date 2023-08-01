*** Settings ***
Library     SeleniumLibrary
Library    DateTime
Resource    ../../Resources/web-version/web_resources.robot
Variables    ../../Resources/web-version/web_variables.py


*** Test Cases ***
As Mentee I can login as Mentee Role on Talent Connect
    Login Into TalentConnect    url=${url}    email=${email_mentee}    password=${password}    assertion_text=Mentee

# As Mentee I can view program page
#     Mentee View Program Page

# As Mentee I can view participant of program
#     Mentee View Participant Program

# As Mentee I can Mid Evaluation result
#     Mentee View Mid Evaluation Result

# As Mentee I can Final Evaluation result
#     Mentee View Final Evaluation Result

# As Mentee I can view Upcoming Activities
#     Mentee View Upcoming Activity

# As Mentee I can view Past Activities
#     Mentee View Past Activity

# As Mentee I can view the detail of activity
#     Mentee View Activity Detail

# As Mentee I can view feedback from mentor
#     Mentee View Feedback

As Mentee I can perform Logout
    Click Logout Button