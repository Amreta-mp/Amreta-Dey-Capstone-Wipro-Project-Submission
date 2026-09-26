*** Settings ***
Resource    ../../resources/keywords/ECommerceKeywords.robot
Resource    ../../config/config.robot
Library     SeleniumLibrary    screenshot_root_directory=${EXECDIR}/screenshots
Library     ../../libraries/TestDataLibrary.py

Suite Setup       Open Browser    ${URL}    ${BROWSER}
Suite Teardown    Close All Browsers

*** Test Cases ***
Data Driven Login Test
    ${data}=    Read Csv Data    ${CURDIR}/../../testdata/login.csv
    FOR    ${row}    IN    @{data}
        Go To    ${URL}/login
        Sleep    1s
        Enter Login Email    ${row}[username]
        Enter Login Password    ${row}[password]
        Click Login Button
        Run Keyword If    '${row}[expected]' == 'success'
        ...    Verify User Logged In
        ...    ELSE
        ...    Page Should Contain    Your email or password is incorrect!
        Run Keyword If    '${row}[expected]' == 'success'    Logout From Website
    END