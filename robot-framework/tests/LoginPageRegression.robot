*** Settings ***
Library            Selenium2Library
Resource           ../resources/resources.robot

Suite Setup        Launch Browser
Test Setup         Navigate to Page
Suite Teardown      Close All Browsers

*** Test Cases ***
Login as a valid user
    [Tags]    Regression Test    Login
    loginPO.Login        practice       SuperSecretPassword! 

Attempt to login with an invalid username
    [Tags]    Regression Test    Login
    loginPO.Login        test       SuperSecretPassword! 
    loginPO.Verify Invalid Username Error Appears

Attempt to login with a username that is just a space
    [Tags]    Regression Test    Login
    loginPO.Login        empty       SuperSecretPassword! 
    loginPO.Verify Invalid Username Error Appears

Attempt to login with an invalid password
    [Tags]    Regression Test    Login
    loginPO.Login        practice       123 
    loginPO.Verify Invalid Password Error Appears

*** Keywords ***
Launch Browser
    Open Browser                https://practice.expandtesting.com/login                    Chrome

Navigate to Page
    Delete All Cookies
    Go To                       https://practice.expandtesting.com/login
    loginPO.Verify Expected Elements appear on Login Page