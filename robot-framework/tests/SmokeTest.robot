*** Settings ***
Library            Selenium2Library
Resource           ../resources/resources.robot

Test Setup         common.Launch Sauce Demo Site
Test Teardown      Close All Browsers

*** Test Cases ***
## User logins
Login as Standard User
    [Tags]    Smoke Test    Login    Standard User
    loginPo.Login as Standard User

Attempt to login as Locked Out User
    [Tags]    Smoke Test    Login    Locked Out User
    loginPo.Attempt to Login as Locked Out User

Login as Problem User
    [Tags]    Smoke Test    Login    Problem User
    loginPo.Login as Problem User

Login as Performance Glitch User
    [Tags]    Smoke Test    Login    Performance Glitch User
    loginPo.Login as Performance Glitch User

Login as Error User
    [Tags]    Smoke Test    Login    Error User
    loginPo.Login as Error User

Login as Visual User
    [Tags]    Smoke Test    Login    Visual User
    loginPo.Login as Visual User

## Pages
Login Page Smoke Test
    [Tags]    Smoke Test    Login
    Log       Login Page Smoke Test

Inventory Page Smoke Test
    [Tags]    Smoke Test    Invetnory
    loginPo.Login as Standard User
