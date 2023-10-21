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

Verify Missing username error message disappear when site is reloaded
    [Tags]    Regression    Login 
    loginPO.Enter Password into Password field            asdf
    loginPO.Click Login button
    loginPo.Verify Username is required error message appears
    Reload Page
    Verify Expected Elements appear on Login Page

Verify Missing password error message disappear when site is reloaded
    [Tags]    Regression    Login 
    loginPO.Enter Username into User Name field           ${Standard_User}
    loginPO.Click Login button
    loginPo.Verify Password is required error message appears
    Reload Page
    Verify Expected Elements appear on Login Page

Verify username and password not matching error message disappear when site is reloaded
    [Tags]    Regression    Login
    loginPO.Enter Username into User Name field           ${Standard_User}
    loginPO.Enter Password into Password field            asdf
    loginPO.Click Login button
    loginPO.Verify Credientials do not match error message appears
    Reload Page
    Verify Expected Elements appear on Login Page

Verify locked out user error message disappear when site is reloaded
    [Tags]    Regression    Login 
    loginPO.Attempt to Login as Locked Out User
    Reload Page
    Verify Expected Elements appear on Login Page