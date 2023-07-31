# Url
url_prod = "http://167.172.84.203.nip.io/"

# Authentication Page
email_field = "//input[@id='Email']"
password_field = "//input[@id='password']"
sign_in_button = "//button[@type='submit']"
google_sign_in_button = "//img[@alt='Google Logo']"

# Side Bar
program_button = "//img[@alt='Program Icon']"
user_management_button = "//img[@alt='User Management Icon']"
evaluation_scoring_button = "//img[@alt='Evaluation Scoring Icon']"
logout_button = "//img[@alt='Profile Icon']"

# Program Page
search_program_field = "//input[@placeholder='Search Program']"
add_program_button = "//button[normalize-space()='+ Add Program']"
add_program_title = "//input[@id='programTitle']"
add_program_startdate = "//input[@id='startDate']"
add_program_enddate = "//input[@id='endDate']"
confirm_add_program = "//button[normalize-space()='Add Program']"
cancel_add_program = "//button[normalize-space()='Cancel']"

target_program = "//h5[contains(text(),'Automation Title')]"
participant_tab = "//div[@id='rc-tabs-0-tab-2']"
add_new_participant = "//button[normalize-space()='+ Add Mentee']"
show_participant_list = "//div[@class=' css-19bb58m']"
confirm_add_participant= "//button[normalize-space()='Confirm']"

menu_target_program = "//div[3]//ul[1]//div[1]//div[2]//div[2]//label[1]//*[name()='svg']"
add_participant = "//button[normalize-space()='Add Participant']"
edit_program = "//button[normalize-space()='Edit Program']"
delete_program = "//button[normalize-space()='Delete Program']"

# User Management Page
search_user_field = "//input[@placeholder='Search User']"
dropdown_filter_user = "//div[@class=' css-15lsz6c-indicatorContainer']//*[name()='svg']"
add_user_button = "//button[normalize-space()='+ Add User']"
toggle_switch_user = '//*[@id="customSwitch2"]'
menu_user_button = "//div[@class='ant-spin-container']//div[1]//div[5]//div[1]//label[1]//*[name()='svg']"
edit_user_button = "//button[@class='dropdown-item']"

# Evaluation Scoring Page
add_evaluation_aspect = "//button[normalize-space()='+ Add Evaluation Aspect']"
back_to_evaluation_page = "//*[name()='path' and contains(@fill-rule,'evenodd')]"
evaluation_aspect_title_field = "//input[@id='evaluationAspectTitle']"
type_aspect_dropdown = ""
option_aspect_dropdown = "//div[@class=' css-19bb58m']"
description_aspect_field = "//textarea[@id='description']"