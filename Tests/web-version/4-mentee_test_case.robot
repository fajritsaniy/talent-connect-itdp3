*** Settings ***
Library     SeleniumLibrary
Library    DateTime
Resource    ../../Resources/web-version/web_resources.robot
Variables    ../../Resources/web-version/web_variables.py


*** Test Cases ***
As Mentee I can login as Mentee Role on Talent Connect
    Login Into TalentConnect    url=${url}    email=${email_mentee}    password=${password}    assertion_text=Mentee

As Mentee I can perform Logout
    Click Logout Button