*** Settings ***
Library            Selenium2Library
Resource           ../resources/resources.robot

Test Setup         common.Launch Sauce Demo Site
Test Teardown      Close All Browsers

*** Test Cases ***
## LoginPage
Smoke Test for Login Page
    [Tags]    Smoke Test    Login
    Log    Test