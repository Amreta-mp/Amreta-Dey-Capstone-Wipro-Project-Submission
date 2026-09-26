*** Settings ***

*** Variables ***
${LOGGED_IN_TEXT}      Logged in as
${LOGOUT_LINK}         link:Logout
${PRODUCTS_LINK}       link:Products

*** Keywords ***
Verify User Logged In
    Wait Until Page Contains    Logged in as    timeout=10s

Click Logout
    Click Element    ${LOGOUT_LINK}

Go To Products Page
    Go To    ${URL}/products