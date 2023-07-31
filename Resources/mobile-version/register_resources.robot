*** Settings ***
Library    SeleniumLibrary
Variables    ../../PageObject/Locators/qa-practice/locator.py

*** Keywords ***
Open Target Browser
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}

Input Firstname
    [Arguments]    ${first_name}
    Input Text    ${txt_first_name_register}    ${first_name}

Input Lastname
    [Arguments]    ${last_name}
    Input Text    ${txt_last_name_register}    ${last_name}

Input Phone Number
    [Arguments]    ${phone}
    Input Text    ${txt_phone_number_register}    ${phone}

Select Country
    [Arguments]    ${country}
    Select From List By Value    ${dropdown_select_country_register}    ${country}

Input Valid Email
    [Arguments]    ${email}
    Input Text    ${txt_email_register}    ${email}

Input Valid Password
    [Arguments]    ${password}
    Input Password    ${txt_password_register}    ${password}

Select My Checkbox
    Select Checkbox    ${txt_checkbox_register}

Click Button Register
    Click Button    ${txt_register_button}

Wait Page Contains
    Wait Until Page Contains    The account has been successfully created!

Capture My Browser
    [Arguments]    ${page_name}
    Capture Page Screenshot    filename=${page_name}

Close My Browser
    Close Browser
