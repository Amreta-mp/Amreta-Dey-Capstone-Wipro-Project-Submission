*** Settings ***
Resource    ../../resources/keywords/ECommerceKeywords.robot
Resource    ../../config/config.robot
Library     SeleniumLibrary    screenshot_root_directory=${EXECDIR}/screenshots

Suite Setup       Open Application
Suite Teardown    Close All Browsers

*** Variables ***
${EMAIL}       amretadey.tensat@gmail.com
${PASSWORD}    MyPass456

*** Keywords ***
Open Application
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    1920    1080

*** Test Cases ***
Verify Website Launch
    ${title}=    Get Title
    Should Not Be Empty    ${title}

Login With Valid Credentials
    Login To Website    ${EMAIL}    ${PASSWORD}
    Verify User Logged In
    Logout From Website