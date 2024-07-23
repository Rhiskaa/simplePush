*** Settings ***
Library    Browser

*** Test Cases ***
Login Sauce demo
    Given User have page Saucedemo
    When input valid credential
    Then Successfully Login

*** Keywords ***
User have page Saucedemo
    New Browser    chromium    headless=false
    New Page    https://www.saucedemo.com/v1/index.html
    Take Screenshot   fullPage=True

input valid credential
    Click   id=user-name
    Type Text   id=user-name    standard_user
    Click       id=password
    Type Text   id=password    secret_sauce
    Take Screenshot   fullPage=True
    Click      id=login-button

Successfully Login
    Wait For Elements State     id=inventory_filter_container   attached
    Take Screenshot   fullPage=True
