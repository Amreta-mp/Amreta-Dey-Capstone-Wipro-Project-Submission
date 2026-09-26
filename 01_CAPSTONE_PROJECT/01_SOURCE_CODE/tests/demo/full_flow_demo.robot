*** Settings ***
Resource    ../../resources/keywords/ECommerceKeywords.robot
Resource    ../../config/config.robot
Library     SeleniumLibrary    screenshot_root_directory=${EXECDIR}/screenshots
Library     ../../libraries/ValidationLibrary.py
Library     Collections

Suite Setup       Open Browser    ${URL}    ${BROWSER}
Suite Teardown    Close All Browsers

*** Variables ***
${EMAIL}       amretadey.tensat@gmail.com
${PASSWORD}    MyPass456

*** Test Cases ***
Full E-Commerce Demo Flow
    # Step 1: Wrong credentials — should be correctly rejected
    Go To Login Page
    Enter Login Email    wronguser@example.com
    Enter Login Password    wrongpassword
    Click Login Button
    Page Should Contain    Your email or password is incorrect!
    Log    Wrong credentials correctly rejected    console=yes

    # Step 2: Correct credentials — should succeed
    Enter Login Email    ${EMAIL}
    Enter Login Password    ${PASSWORD}
    Click Login Button
    Verify User Logged In
    Log    Logged in successfully    console=yes

    # Step 3: Search and add two products
    @{all_totals}=    Create List
    Search For Product And Add To Cart    Tshirt
    Search For Product And Add To Cart    Jeans

    # Step 4: Verify cart and validate with Python
    Verify Product In Cart
    ${row_count}=    Get Cart Row Count
    ${last}=    Evaluate    ${row_count} + 1
    FOR    ${i}    IN RANGE    1    ${last}
        ${price}=       Get Cart Row Price    ${i}
        ${quantity}=    Get Cart Row Quantity    ${i}
        ${total}=       Get Cart Row Total    ${i}
        Log    Row ${i}: price=${price} x quantity=${quantity} should equal total=${total}    console=yes
        Validate Total    ${price}    ${quantity}    ${total}
        Append To List    ${all_totals}    ${total}
    END
    ${cart_value}=    Sum Totals    ${all_totals}
    Log    Final Cart Value = ${cart_value}    console=yes

    # Step 5: Logout
    Logout From Website
    Log    Logged out successfully    console=yes