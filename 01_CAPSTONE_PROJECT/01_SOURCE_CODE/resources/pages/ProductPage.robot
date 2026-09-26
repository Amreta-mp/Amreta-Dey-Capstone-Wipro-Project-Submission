*** Settings ***

*** Variables ***
${SEARCH_BOX}          id:search_product
${SEARCH_BUTTON}       id:submit_search
${SEARCHED_PRODUCTS_TITLE}    css:.title.text-center
${FIRST_ADD_TO_CART}   css:.product-image-wrapper .add-to-cart
${CONTINUE_SHOPPING}   css:.btn.btn-success.close-modal.btn-block

*** Keywords ***
Search For Product
    [Arguments]    ${product_name}
    Input Text    ${SEARCH_BOX}    ${product_name}
    Execute Javascript    document.getElementById('submit_search').click();

Verify Search Results Title
    Wait Until Page Contains    Searched Products    timeout=10s

Add First Product To Cart
    Mouse Over    ${FIRST_ADD_TO_CART}
    Execute Javascript    document.querySelector('.product-image-wrapper .add-to-cart').click();
    Wait Until Element Is Visible    ${CONTINUE_SHOPPING}    timeout=10s
    Click Element    ${CONTINUE_SHOPPING}