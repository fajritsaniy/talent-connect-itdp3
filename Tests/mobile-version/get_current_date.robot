# Kumpulan libraries yang digunakan pada proyek kita
*** Settings ***
# Cara import libary date time
Library    DateTime
# Notes : tidak hanya file library, kita bisa juga import file .robot lain, dan file .py .resource

*** Test Cases ***
Get Current Date
    # Ini adalah variable pada robotframework
    ${date}    Get Current Date
    Log    Current Date: ${date}

# To define manually file output name
# Output => -o --output
# Log => -l --log
# Report => -r --report

# Example -> robot -d Results -l log-get-date.html -o output-get-date.xml -r report-get-date.html Tests/get_current_date.robot

# To run all test .robot file in folder -> robot -d Results Tests