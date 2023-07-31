*** Settings ***
Library     SeleniumLibrary
Library    DateTime
Resource    ../../Resources/web-version/web_resources.robot
Variables    ../../Resources/web-version/web_variables.py


*** Test Cases ***
As Mentor I can login as Mentor Role on Talent Connect
    Login Into TalentConnect    url=${url}    email=${email_mentor}    password=${password}    assertion_text=Mentor

# As Mentor I can add activity
#     Add New Activity on Program    role=Mentor    participant_name=Mentee

# As A Mentor I can view the activity detail
#     Sleep    2s
#     Click Element    //h5[normalize-space()='Past Activities']
#     Wait Until Page Contains    text=Mentor Automation Activity
#     Sleep    2s
#     Click Element    locator=//h5[normalize-space()='Mentor Automation Activity']
#     Wait Until Page Contains    text=Mentor Automation Activity Description
#     Wait Until Page Contains    text=Mentor Automation Activity

# As A Mentor I can perform write feedback for the Mentee
#     Move to Program Page
#     Search bar on Program Page    target_text=Automation Title    exclude_text=Joging
#     Sleep    1s
#     Click Element    locator=${target_program}   
#     Sleep    2s
#     Click Element    //h5[normalize-space()='Past Activities']
#     Sleep    1s
#     Scroll into end of page
#     Click Element    //button[normalize-space()='Write Feedback']
#     Sleep    2s
#     Click Element    //span[normalize-space()='Mentee 1']
#     Wait Until Element Is Visible    //button[normalize-space()='Add Feedback']
#     Input Text    locator=//textarea[@id='feedback']    text=Automation Feedback
#     Click Element    //button[normalize-space()='Add Feedback']
#     Sleep    1s
#     Reload Page
#     Sleep    1s
#     Click Element    //li[@class='list-group-item list-group-item-action border-0 px-3']//div
#     Wait Until Page Contains    text=Automation Feedback

# As A Mentor I can perform check mentee and program that assigned
#     Click Element    //img[@alt='Mentee Icon']
#     Wait Until Page Contains    text=Automation Title
#     Wait Until Page Contains    text=assigned programs
#     Wait Until Page Contains    text=asigned mentees


As Mentor I can perform Logout
    Click Logout Button