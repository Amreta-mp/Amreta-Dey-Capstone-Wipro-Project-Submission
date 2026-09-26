*** Settings ***
Resource    ../../resources/keywords/ECommerceKeywords.robot
Resource    ../../config/config.robot
Library     SeleniumLibrary    screenshot_root_directory=${EXECDIR}/screenshots

Suite Setup       Open Browser    ${URL}    ${BROWSER}
Suite Teardown    Close All Browsers

*** Test Cases ***
Search For Existing Product
    Go To Products Page
    Search For Product    Tshirt
    Verify Search Results Title