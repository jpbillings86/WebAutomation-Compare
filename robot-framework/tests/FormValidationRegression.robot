*** Settings ***
Library            Selenium2Library
Resource           ../resources/resources.robot

Suite Setup        Launch Browser
Test Setup         Navigate to Page
Suite Teardown     Close All Browsers

*** Test Cases ***
#Contact Name
Verify Empty Error message appears for Contact Name
    [Tags]    Regression Test    Form Validation    Contact Name
    formValidationPO.Clear Contact Name
    formValidationPO.Click Register
    formValidationPO.Verify Empty Contact Name Error Appears

Verify Looks Good message appears for Contact Name
    [Tags]    Regression Test    Form Validation    Contact Name
    formValidationPO.Enter Contact Name        test
    formValidationPO.Click Register
    formValidationPO.Verify Looks Good ContactName Message Appears
    formValidationPO.Verify Empty Contact Name Error Does Not Appear

#Contact Number
Verify Empty Error message does not appear for Contact Number with valid input
    [Tags]    Regression Test    Form Validation    Contact Number
    formValidationPO.Enter Contact Number       123-1234567     
    formValidationPO.Click Register
    formValidationPO.Verify Invalid Contact Number Error Does Not Appear

Verify Invalid Error message appears for Contact Number when Empty
    [Tags]    Regression Test    Form Validation    Contact Number
    formValidationPO.Clear Contact Number
    formValidationPO.Click Register
    formValidationPO.Verify Invalid Contact Number Error Appears

Verify Invalid Error message appears for Contact Number with invalid input
    [Tags]    Regression Test    Form Validation    Contact Number
    formValidationPO.Enter Contact Number         123
    formValidationPO.Click Register
    formValidationPO.Verify Invalid Contact Number Error Appears

#PickUp Date
Verify Empty Error message does not appear for PickUp Date with valid input
    [Tags]    Regression Test    Form Validation    PickUp Date
    formValidationPO.Enter PickUp Date    11/11/1111     
    formValidationPO.Click Register
    formValidationPO.Verify Invalid PickUp Date Error Does Not Appear

Verify Invalid Error message appears for PickUp Date when Empty
    [Tags]    Regression Test    Form Validation    PickUp Date
    formValidationPO.Clear PickUp Date
    formValidationPO.Click Register
    formValidationPO.Verify Invalid PickUp Date Error Appears

Verify Invalid Error message appears for PickUp Date with invalid input
    [Tags]    Regression Test    Form Validation    PickUp Date
    formValidationPO.Enter PickUp Date    11   
    formValidationPO.Click Register
    formValidationPO.Verify Invalid PickUp Date Error Appears

#Payment Method
Verify Empty Error message does not appear for Payment Method when something is selected
    [Tags]    Regression Test    Form Validation    Payment Method
    formValidationPO.Select Payment Method         cash on delivery 
    formValidationPO.Click Register
    formValidationPO.Verify Invalid Payment Method Error Does Not Appear

Verify Invalid Error message appears for Payment Method when Empty
    [Tags]    Regression Test    Form Validation    Payment Method
    formValidationPO.Click Register
    formValidationPO.Verify Invalid Payment Method Error Appears

*** Keywords ***
Launch Browser
    Open Browser                https://practice.expandtesting.com/form-validation                    Chrome

Navigate to Page
    Delete All Cookies
    Go To                       https://practice.expandtesting.com/form-validation  
    formValidationPO.Verify Expected Elements appear on Form Validation Page
