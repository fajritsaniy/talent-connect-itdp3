*** Settings ***
Library     SeleniumLibrary
Library    DateTime
Resource    ../../Resources/web-version/web_resources.robot
Variables    ../../Resources/web-version/web_variables.py


*** Test Cases ***
As Admin I can login as Admin Role on Talent Connect
    Login Into TalentConnect    url=${url}   browser=${browser}    email=${email_admin}    password=${password}    assertion_text=Admin

As Admin I can find program on search bar
    Search bar on Program Page    target_text=ITDP 3    exclude_text=Joging

As Admin I can add new program
    Add New TalentConnect Program    title=Automation Title    start_date=07/01/2023    end_date=08/01/2023

As Admin I can add new participant on target program
    Add New Participant on Program    program_title=Automation Title    participant_name=Mentee

As Admin I can add new activity
    Add New Activity on Program    role=Admin    participant_name=all
    
As Admin I Can Move to User Management Page
    Move to User Management Page

# As Admin I Can Filter Mentee user
#     Filter on User Management Page    role=Mentee

# As Admin I Can Filter Mentor user
#     Filter on User Management Page    role=Mentor

# As Admin I Can Filter Judge user
#     Filter on User Management Page    role=Judge
#     Reload Page
#     Sleep    1s

# As Admin I can filter active user
#     Filter User Activation    status=Active

# As Admin I can filter inactive user
#     Filter User Activation    status=Inactive
#     Reload Page
#     Sleep    1s

# As Admin I Can Search User by Name
#     Search bar on User Management Page    target_text=mentee    exclude_text=Mentor

# As Admin I can add new mentee user
#     Add New User on TalentConnect    name=Automation User    email=automation@gmail.com    role=Mentee

# As Admin I can assign mentee to mentor
#     Assign Mentee to Mentor

As Admin I can assign mentee to judges
    Assign Mentee to Judge

As Admin I can create evaluation aspect
    Create new Evaluation Aspect    title_aspect=Automation Aspect    description_aspect=Automation Description

As Admin I can create evaluation category
    Create new Evaluation Category    title_aspect=Automation Aspect    title_category=Automation Category

As Admin I can assign evaluation category to Program
    Assign Evaluation Category into Program    program_name=Automation Title

As Admin I can perform Logout
    Click Logout Button