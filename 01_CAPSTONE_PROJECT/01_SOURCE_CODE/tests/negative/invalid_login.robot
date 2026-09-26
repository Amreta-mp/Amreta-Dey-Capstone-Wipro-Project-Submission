*** Settings ***
Resource    ../../resources/keywords/ECommerceKeywords.robot
Resource    ../../config/config.robot
Library     SeleniumLibrary    screenshot_root_directory=${EXECDIR}/screenshots

Suite Setup       Open Browser    ${URL}    ${BROWSER}
Suite Teardown    Close All Browsers

*** Test Cases ***
Login With Invalid Credentials Should Fail
    Login To Website    wronguser@example.com    wrongpassword
    Page Should Contain    Your email or password is incorrect!