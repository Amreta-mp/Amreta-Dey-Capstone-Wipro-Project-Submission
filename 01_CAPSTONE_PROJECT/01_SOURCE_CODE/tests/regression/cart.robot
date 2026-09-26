*** Settings ***
Resource    ../../resources/keywords/ECommerceKeywords.robot
Resource    ../../config/config.robot
Library     SeleniumLibrary    screenshot_root_directory=${EXECDIR}/screenshots
Library     ../../libraries/ValidationLibrary.py
Library     Collections

Suite Setup       Open Browser    ${URL}    ${BROWSER}
Suite Teardown    Close All Browsers
*** Test Cases ***
Add Multiple Products To Cart And Verify
    @{all_totals}=    Create List
    Search For Product And Add To Cart    Tshirt
    Search For Product And Add To Cart    Jeans
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
    Log    Final Cart Value (all products combined) = ${cart_value}    console=yes