*** Settings ***
Library         SeleniumLibrary
Library    DateTime
Variables       ../../PageObject/Locators/web-version/locator.py
Variables    ../../Resources/web-version/web_variables.py

*** Keywords ***
Open Target Browser
    [Arguments]    ${url}

    # Production
    # No Sandbox Open Browser    ${url}

    # Development
    Open Browser    ${url}    Chrome
    Maximize Browser Window

No Sandbox Open Browser
    [Arguments]    ${url}
    ${chrome options} =     Evaluate    selenium.webdriver.ChromeOptions()
    ...                     modules=selenium, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    ${window_size}
    Call Method    ${chrome_options}   add_argument    start-maximize
    Call Method    ${chrome_options}   add_argument    no-sandbox   # newly added argument
    Call Method    ${chrome_options}   add_argument    disable-gpu
    Call Method    ${chrome_options}   add_argument    ignore-certificate-errors

    ${var}=     Call Method     ${chrome_options}    to_capabilities 
    Create Webdriver   driver_name=Chrome   alias=google   chrome_options=${chrome_options}     
    Go To   ${url}
    Maximize Browser Window

Input Email Credential
    [Arguments]    ${email}
    Input Text    ${email_field}    ${email}

Input Password Credential
    [Arguments]    ${password}
    Input Password    ${password_field}    ${password}

Click Login Button
    Click Button    locator=${sign_in_button}

Login Into TalentConnect
    [Arguments]    ${url}   ${email}    ${password}    ${assertion_text}
    Open Target Browser    url=${url}
    Input Email Credential    email=${email} 
    Input Password Credential    password=${password}
    Click Login Button
    Wait Until Page Contains    text=${assertion_text}

Move to Program Page
    Click Element    locator=${program_button}
    Sleep    1s

Add New TalentConnect Program
    [Arguments]    ${title}    ${start_date}    ${end_date}
    Click Element    locator=${add_program_button}
    Input Text    locator=${add_program_title}    text=${title}
    Input Text    locator=${add_program_startdate}    text=${start_date}
    Input Text    locator=${add_program_enddate}    text=${end_date}
    Click Element    locator=${confirm_add_program}
    Wait Until Page Contains    text=${title}

Add New Participant on Program
    [Arguments]    ${program_title}    ${participant_name}
    Move to Program Page
    Search bar on Program Page    target_text=Automation Title    exclude_text=Joging
    Click Element    locator=${target_program}
    Sleep    2s
    Click Element    locator=${participant_tab}
    Wait Until Page Contains    text=Mentees
    Sleep    1s
    Click Element    locator=${add_new_participant}
    Sleep    1s
    Click Element    locator=${show_participant_list}
    Sleep    1s
    Press Keys    None    ${participant_name}
    Sleep    1s
    Press Keys    None    RETURN
    Sleep    1s
    Click Element    locator=${confirm_add_participant}

Add New Activity on Program
    [Arguments]    ${role}    ${participant_name}
    ${day_addition}=    Set Variable If    '${role}'=='Mentor'    0    8
    ${time}=    Set Variable If    '${role}'=='Mentor'    00    11
    ${date}=    Get Current Date    UTC
    ${future_date}    Add Time To Date    ${date}    ${day_addition} days
    ${activity_date}    Convert Date    ${future_date}    result_format=%m-%d-%Y 
    Sleep    1s
    Move to Program Page
    Search bar on Program Page    target_text=Automation Title    exclude_text=Joging
    Sleep    1s
    Click Element    locator=${target_program}
    Click Element    //button[normalize-space()='+ Add Activity']
    Wait Until Page Contains    Add Activity
    Input Text    //input[@id='activityTitle']    ${role} Automation Activity
    Input Text    //input[@id='link']    www.automation.com
    Click Element    //input[@id='date']
    Input Text    //input[@id='date']     ${activity_date}
    Press Keys    None    ARROW_RIGHT
    Press Keys    None    ${time}:00AM
    Run Keyword If    '${role}'=='Mentor'    Add Participant when Create Activity    participant_name=${participant_name}
    Input Text    //textarea[@id='description']    ${role} Automation Activity Description
    Scroll into end of page
    Click Element    //button[normalize-space()='Add Activity']
    Wait Until Page Contains    ${role} Automation Activity   

Add Participant when Create Activity
    [Arguments]    ${participant_name}
    Click Element    //*[@id="root"]/div[1]/div/div/div[2]/div/div/form/div[4]/div/div/div[1]/div[2]
    Sleep    1s
    Press Keys    None    ${participant_name}
    Sleep    1s
    Press Keys    None    RETURN
    Sleep    1s

Search bar on Program Page
    [Arguments]    ${target_text}    ${exclude_text}
    Wait Until Element Is Visible    locator=${search_program_field}
    Input Text    locator=${search_program_field}    text=${target_text}
    Wait Until Page Does Not Contain    text=${exclude_text}

Remove Program TalentConnect
    [Arguments]    ${program_title}    ${exclude_program_title}
    Move to Program Page
    Search bar on Program Page    target_text=${program_title}    exclude_text=${exclude_program_title}
    Click Element    locator=//*[name()='path' and contains(@d,'M96 184c39')]
    Click Element    locator=//button[normalize-space()='Delete Program']
    Wait Until Element Is Visible    locator=//*[@id="root"]/div[1]/div/div/div[2]/div[1]/div[4]/div/div/div[2]/button[2]
    Click Element    locator=//*[@id="root"]/div[1]/div/div/div[2]/div[1]/div[4]/div/div/div[2]/button[2]
    

Move to User Management Page
    Click Element    locator=${user_management_button}
    Wait Until Page Contains    text=User Management

Search bar on User Management Page
    [Arguments]    ${target_text}    ${exclude_text}
    Input Text    locator=${search_user_field}    text=${target_text}
    Wait Until Page Does Not Contain    text=${exclude_text}

Add New User on TalentConnect
    [Arguments]    ${name}    ${email}    ${role}
    Click Element    locator=${add_user_button}
    Input Text    locator=//input[@id='name']    text=${name}
    Input Text    locator=//input[@id='email']    text=${email}
    Click Element    locator=//*[@id="role"]/div/div[1]/div[2]
    Press Keys    None    ${role}
    Sleep    1s
    Press Keys    None    RETURN
    Wait Until Element Is Visible    locator=//button[normalize-space()='Cancel']   
    # Change to //button[normalize-space()='Add User'] on production
    Click Element    locator=//button[normalize-space()='Cancel']
    Sleep    1s

Assign Mentee to Mentor
    Reload Page
    Search bar on User Management Page    target_text=mentor    exclude_text=Mentee
    Wait Until Element Is Visible    //div[3]//div[5]//div[1]//label[1]//*[name()='svg']
    Click Element    //div[3]//div[5]//div[1]//label[1]//*[name()='svg']
    Wait Until Element Is Visible    //button[normalize-space()='Assign Mentee to Mentor']
    Click Element    //button[normalize-space()='Assign Mentee to Mentor']
    Sleep    1s
    Scroll into end of page
    Wait Until Element Is Visible    //h5[normalize-space()='Automation Title']    
    Click Element    //h5[normalize-space()='Automation Title']
    Sleep    1s  
    Click Element    //button[normalize-space()='+ Add Mentee']
    Sleep    1s
    Click Element    //*[@id="root"]/div[1]/div/div/div[2]/div[2]/div/div/div[1]/div/div/div/div/div[1]/div[2]
    Sleep    1s
    Press Keys    None    Mentee
    Sleep    1s
    Press Keys    None    RETURN
    Wait Until Element Is Visible    //*[@id="root"]/div[1]/div/div/div[2]/div[2]/div/div/div[2]/button[2]    
    Click Element    //*[@id="root"]/div[1]/div/div/div[2]/div[2]/div/div/div[2]/button[2]
    Sleep    1s

Assign Mentee to Judge
    Move to User Management Page
    Reload Page
    Search bar on User Management Page    target_text=judges    exclude_text=Mentee
    Sleep    1s
    Click Element    //div[3]//div[5]//div[1]//label[1]//*[name()='svg']
    Sleep    2s
    Click Element    //button[normalize-space()='Assign Mentee to Judge']
    Sleep    1s
    Scroll into end of page
    Click Element    //h5[normalize-space()='Automation Title']
    Sleep    1s
    Click Element    //button[normalize-space()='+ Add Panelist']
    Sleep    2s
    Click Element    //*[@id="root"]/div[1]/div/div/div[2]/div[2]/div/div/div[1]/div/div/div/div/div[1]/div[2]
    Sleep    2s
    Press Keys    None    Mentee
    Sleep    1s
    Press Keys    None    RETURN
    Sleep    1s
    Click Element    //*[@id="root"]/div[1]/div/div/div[2]/div[2]/div/div/div[2]/button[2]
    Sleep    1s

Filter on User Management Page
    [Arguments]    ${role}
    Click Element    locator=//*[@id="role"]/div/div[1]/div[2]
    Press Keys    None    ${role}
    Sleep    1s
    Press Keys    None    RETURN
    Sleep    1s
    
Filter User Activation
    [Arguments]    ${status}
    Click Element    locator=//*[@id="status"]/div/div[1]/div[2]
    Press Keys    None    ${status}
    Sleep    1s
    Press Keys    None    RETURN
    Sleep    1s

Move to Evaluation Scoring Page
    Click Element    locator=${evaluation_scoring_button}
    Wait Until Page Contains    text=Evaluation Aspects

Create new Evaluation Aspect
    [Arguments]   ${title_aspect}    ${description_aspect}
    Move to Evaluation Scoring Page
    Click Element    //button[normalize-space()='+ Add Evaluation Aspect']
    Wait Until Page Contains    Add Evaluation Aspect
    Input Text    //input[@id='evaluationAspectTitle']    ${title_aspect}
    Click Element    //*[@id="option"]/div/div[1]/div[2]
    Sleep    1s
    Press Keys    None    5
    Sleep    1s
    Press Keys    None    RETURN
    Sleep    1s
    Input Text    //textarea[@id='description']    ${description_aspect}
    Scroll into end of page
    Click Element    //button[normalize-space()='Add Evaluation Aspect']
    Sleep    1s

Create new Evaluation Category
    [Arguments]    ${title_aspect}    ${title_category}
    Scroll into end of page
    Sleep    1s
    Click Element    //button[normalize-space()='+ Add Evaluation Category']
    Wait Until Page Contains    Add Evaluation Category
    Input Text    //input[@id='evaluationAspectTitle']    ${title_category}
    Click Element    //button[normalize-space()='+']
    Sleep    1s
    Click Element    //label[normalize-space()='${title_aspect}']//input[@type='checkbox']
    Sleep    1s
    Click Element    //*[@id="root"]/div[1]/div/div/div[2]/div[2]/div/div/div[3]/button[2]
    Sleep    1s
    Click Element    //*[@id="root"]/div[1]/div/div/div[2]/div[1]/form/button[1]
    Sleep    1s
    Reload Page

Assign Evaluation Category into Program
    [Arguments]    ${category_name}
    Sleep    2s
    Click Element    //div[@id='rc-tabs-0-tab-2']
    Sleep    1s
    Scroll into end of page
    Sleep    1s
    Click Element    //span[normalize-space()='Automation Title']
    Sleep    1s
    Scroll into top of page
    Sleep    1s
    Wait Until Page Contains    Add Category
    Click Element    //div[@class='d-flex align-items-center gap-2']
    Sleep    1s
    Click Element    //*[@id="type"]/div/div[1]/div[2]
    Sleep    1s
    Press Keys    None    ${category_name}
    Sleep    1s
    Press Keys    None    RETURN
    Sleep    1s
    Input Text    //input[@placeholder='Enter Weight ex: 10']    100
    Sleep    1s
    Click Element    //*[@id="rc-tabs-0-panel-2"]/div/div[2]/div/div/div[2]/button[2]
    Sleep    1s

Admin VIew Final Result of Program
    Search bar on Program Page    target_text=Automation Title    exclude_text=Joging
    Click Element    locator=${target_program}
    Sleep    2s
    Click Element    locator=//div[@id='rc-tabs-0-tab-3']
    Wait Until Page Contains    Evaluation Progress


Remove Evaluation Aspect
    Move to Evaluation Scoring Page
    Execute JavaScript    window.scrollBy(0, 200)
    Sleep    1s
    Click Element    //div[6]//div[1]//div[5]//div[1]//label[1]//*[name()='svg']
    Sleep    1s
    Click Element    //button[normalize-space()='Delete Evaluation Aspect']
    Sleep    1s
    Click Element
    ...    //*[@id="rc-tabs-0-panel-1"]/div/div/div[1]/div/div[6]/div/div[5]/div[2]/div/div/div[2]/button[2]
    Sleep    1s

Remove Evaluation Category
    Scroll into end of page
    Click Element
    ...    //div[5]//div[1]//div[2]//div[1]//label[1]//*[name()='svg']
    Sleep    1s
    Click Element    //button[normalize-space()='Delete Evaluation Category']
    Sleep    1s
    Click Element
    ...    //div[@class='modal fade show']//button[@type='submit'][normalize-space()='Confirm']
    Sleep    1s

Scroll into end of page
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Sleep    1s

Scroll into top of page
    Execute JavaScript    window.scrollTo(0, 0)
    Sleep    1s

Click Logout Button
    Click Element    locator=${logout_button}
    Sleep    1s
    Close Browser
    

# MENTOR
Mentor View Activity Detail
    Sleep    2s
    Click Element    //h5[normalize-space()='Past Activities']
    Wait Until Page Contains    text=Mentor Automation Activity
    Sleep    2s
    Click Element    locator=//h5[normalize-space()='Mentor Automation Activity']
    Wait Until Page Contains    text=Mentor Automation Activity Description
    Wait Until Page Contains    text=Mentor Automation Activity

Mentor Write Feedback for Mentee
    Move to Program Page
    Search bar on Program Page    target_text=Automation Title    exclude_text=Joging
    Sleep    1s
    Click Element    locator=${target_program}   
    Sleep    2s
    Click Element    //h5[normalize-space()='Past Activities']
    Sleep    1s
    Scroll into end of page
    Click Element    //button[normalize-space()='Write Feedback']
    Sleep    2s
    Click Element    //span[normalize-space()='Mentee 1']
    Wait Until Element Is Visible    //button[normalize-space()='Add Feedback']
    Input Text    locator=//textarea[@id='feedback']    text=Automation Feedback
    Click Element    //button[normalize-space()='Add Feedback']
    Sleep    1s
    Reload Page
    Sleep    1s
    Click Element    //li[@class='list-group-item list-group-item-action border-0 px-3']//div
    Wait Until Page Contains    text=Automation Feedback

Mentor Check Feedback for Mentee
    Click Element    //img[@alt='Mentee Icon']
    Wait Until Page Contains    text=Automation Title
    Wait Until Page Contains    text=Assigned Programs
    Wait Until Page Contains    text=Assigned Mentees

# JUDGES
Judge View Detail Program
    Search bar on Program Page    target_text=Automation Title    exclude_text=Joging
    Sleep    1s
    Click Element    locator=${target_program}   

Judge Evaluate Mid Evaluation
    Sleep    1s
    Click Element    //button[normalize-space()='Evaluate']
    Sleep    1s
    Wait Until Page Contains    Automation Aspect
    Sleep    2s
    Click Element    //*[@id="root"]/div[1]/div/div/div[2]/div/div/form/div[1]/div[2]/div/div[5]//input[@type='radio']
    Sleep    2s
    Click Element    //button[normalize-space()='Add Evaluation']
    Sleep    1s

Jugde Evaluate Final Evaluation
    Sleep    1s
    Click Element    //h6[normalize-space()='Final Evaluation']
    Sleep    1s
    Click Element    //button[normalize-space()='Evaluate']
    Sleep    1s
    Wait Until Page Contains    Automation Aspect
    Sleep    2s
    Click Element    //*[@id="root"]/div[1]/div/div/div[2]/div/div/form/div[1]/div[2]/div/div[5]//input[@type='radio']
    Sleep    2s
    Click Element    //button[normalize-space()='Add Evaluation']
    Sleep    2s

Judge View Result Mid Evaluation
    Sleep    1s
    Click Element    //span[normalize-space()='Mentee 1']
    Sleep    1s
    Wait Until Page Contains    Automation Category
    Wait Until Page Contains    Total Score
    Sleep    1s
    Click Element    //a[@class='ant-breadcrumb-link']
    Sleep    1s

Judge View Result Final Evaluation
    Sleep    1s
    Click Element    //h6[normalize-space()='Final Evaluation']
    Sleep    1s
    Click Element    //span[normalize-space()='Mentee 1']
    Sleep    1s
    Wait Until Page Contains    Automation Category
    Wait Until Page Contains    Total Score
    Sleep    1s

# MENTEES
Mentee View Program Page
    Search bar on Program Page    target_text=Automation Title    exclude_text=Joging
    Sleep    1s
    Click Element    locator=${target_program}

Mentee View Participant Program
    Sleep    1s
    Click Element    //div[@id='rc-tabs-0-tab-2']
    Sleep    1s

Mentee View Mid Evaluation Result
    Click Element    //div[@id='rc-tabs-0-tab-3']
    Sleep    1s
    Click Element    //span[normalize-space()='Mid Evaluation']
    Wait Until Page Contains    Total Score

Mentee View Final Evaluation Result
    Sleep    1s
    Click Element    //span[normalize-space()='Final Evaluation']
    Wait Until Page Contains    Total Score
    Sleep    1s

Mentee View Upcoming Activity
    Move to Program Page
    Search bar on Program Page    target_text=Automation Title    exclude_text=Joging
    Sleep    1s
    Click Element    locator=${target_program}
    Sleep    1s

Mentee View Past Activity
    Click Element    //h5[normalize-space()='Past Activities']
    Sleep    1s
    Scroll into end of page

Mentee View Activity Detail
    Sleep    1s
    Click Element    //h5[normalize-space()='Mentor Automation Activity']
    
Mentee View Feedback
    Sleep    1s
    Scroll into end of page
    Sleep    1s