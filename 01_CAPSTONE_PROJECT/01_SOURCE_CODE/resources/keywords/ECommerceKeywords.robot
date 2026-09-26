*** Settings ***
Resource    ../pages/LoginPage.robot
Resource    ../pages/HomePage.robot
Resource    ../pages/ProductPage.robot
Resource    ../pages/CartPage.robot
Library     ../../libraries/BrowserUtility.py

*** Keywords ***
Login To Website
    [Arguments]    ${email}    ${password}
    Log Step    Attempting login with ${email}
    Go To Login Page
    Enter Login Email    ${email}
    Enter Login Password    ${password}
    Click Login Button
    Log Step    Login submitted

Search For Product And Add To Cart
    [Arguments]    ${product_name}
    Log Step    Searching for product: ${product_name}
    Go To Products Page
    Search For Product    ${product_name}
    Verify Search Results Title
    Add First Product To Cart
    Log Step    Product added to cart: ${product_name}

Verify Product In Cart
    Open Cart
    Verify Cart Page Displayed
    Log Step    Cart page verified

Logout From Website
    Click Logout
    Log Step    Logged out