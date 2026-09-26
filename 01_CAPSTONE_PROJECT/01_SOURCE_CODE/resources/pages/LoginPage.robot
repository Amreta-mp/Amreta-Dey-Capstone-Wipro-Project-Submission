*** Settings ***

*** Variables ***
${SIGNUP_LOGIN_LINK}      link:Signup / Login
${LOGIN_EMAIL_FIELD}      css:input[data-qa="login-email"]
${LOGIN_PASSWORD_FIELD}   css:input[data-qa="login-password"]
${LOGIN_BUTTON}           css:button[data-qa="login-button"]

*** Keywords ***
Go To Login Page
    Click Element    ${SIGNUP_LOGIN_LINK}

Enter Login Email
    [Arguments]    ${email}
    Input Text    ${LOGIN_EMAIL_FIELD}    ${email}

Enter Login Password
    [Arguments]    ${password}
    Input Text    ${LOGIN_PASSWORD_FIELD}    ${password}

Click Login Button
    Execute Javascript    document.querySelector('[data-qa="login-button"]').click();