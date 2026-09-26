*** Settings ***
Library    String

*** Variables ***
${CART_LINK}           link:Cart
${CART_ITEMS_TABLE}    id:cart_info

*** Keywords ***
Open Cart
    Click Element    ${CART_LINK}

Verify Cart Page Displayed
    Wait Until Element Is Visible    ${CART_ITEMS_TABLE}    timeout=10s
    Location Should Contain    view_cart

Get Cart Row Count
    ${count}=    Get Element Count    css:#cart_info tbody tr
    RETURN    ${count}

Get Cart Row Price
    [Arguments]    ${row_index}
    ${text}=    Get Text    css:#cart_info tbody tr:nth-child(${row_index}) .cart_price p
    ${clean}=   Replace String    ${text}    Rs.    ${EMPTY}
    ${clean}=   Strip String    ${clean}
    RETURN    ${clean}

Get Cart Row Quantity
    [Arguments]    ${row_index}
    ${qty}=    Get Text    css:#cart_info tbody tr:nth-child(${row_index}) .cart_quantity button
    RETURN    ${qty}

Get Cart Row Total
    [Arguments]    ${row_index}
    ${text}=    Get Text    css:#cart_info tbody tr:nth-child(${row_index}) .cart_total p
    ${clean}=   Replace String    ${text}    Rs.    ${EMPTY}
    ${clean}=   Strip String    ${clean}
    RETURN    ${clean}