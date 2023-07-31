# Testcases -> Seperti langkah (step) untuk melakukan testing
*** Test Cases ***
# Membuat sebuah name TestCase -> Harus informatif
This is my first test case
    # Keyword -> Message
    # Keyboard bisa juga disebut sebagai function -> Bisa menerima lebih dari 1 argumen
    Log    This is a Robot Framework test step!
    Log To Console    Logging to console

# How to run -> robot -d <ResultFolder> <RobotFile>