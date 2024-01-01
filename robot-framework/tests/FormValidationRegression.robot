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