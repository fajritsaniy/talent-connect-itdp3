*** Settings ***
Library     SeleniumLibrary
Library    DateTime
Resource    ../../Resources/web-version/web_resources.robot
Variables    ../../Resources/web-version/web_variables.py


*** Test Cases ***
As Mentor I can login as Mentor Role on Talent Connect
    Login Into TalentConnect    url=${url}    email=${email_mentor}    password=${password}    assertion_text=Mentor

As Mentor I can add activity
    Add New Activity on Program    role=Mentor    participant_name=Mentee

As A Mentor I can view the activity detail
    Mentor View Activity Detail

As A Mentor I can perform write feedback for the Mentee
    Mentor Write Feedback for Mentee

As A Mentor I can perform check mentee and program that assigned
    Mentor CHeck Feedback for Mentee

As Mentor I can perform Logout
    Click Logout Button