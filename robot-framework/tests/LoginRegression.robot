*** Settings ***
Library            Selenium2Library
Resource           ../resources/resources.robot

Test Setup         common.Launch Sauce Demo Site
Test Teardown      Close All Browsers

*** Test Cases ***
## LoginPage
Attempt to log in without giving a username
    [Tags]    Regression    Login
    loginPO.Enter Password into Password field            asdf
    loginPO.Click Login button
    loginPo.Verify Username is required error message appears

Attempt to log in without giving a password
    [Tags]    Regression    Login
    loginPO.Enter Username into User Name field           asdf
    loginPO.Click Login button
    loginPO.Verify Password is required error message appears

Attempt to log in with a username and password that does not match
    [Tags]    Regression    Login
    loginPO.Enter Username into User Name field           ${Standard_User}
    loginPO.Enter Password into Password field            asdf
    loginPO.Click Login button
    loginPO.Verify Credientials do not match error message appears

Attempt to log in as Locked out User
    [Tags]    Regression    Login
    loginPO.Attempt to Login as Locked Out User