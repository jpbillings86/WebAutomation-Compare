*** Settings ***
Resource    ../resources.robot

*** Variables ***
${FormValidationPage_Title_text}                                    //h1[text()='Form Validation']
${FormValidationPage_ContactName_input}                             //input[@name='ContactName']
${FormValidationPage_ContactNumber_input}                           //input[@name='contactnumber']
${FormValidationPage_PickUpDate_input}                              //input[@name='pickupdate']
${FormValidationPage_PaymentMethod_select}                          //select[@name='payment']
${FormValidationPage_Register_button}                               //button[text()=' Register ']
#Errors
${FormValidationPage_ContactName_Empty_error}                       //div[contains(text(),'Please enter your Contact name.')]
${FormValidationPage_ContactName_LooksGood_message}                 //div[contains(text(),'Looks good!')]
${FormValidationPage_ContactNumber_Invalid_error}                   //div[contains(text(),'Please provide your Contact number.')]
${FormValidationPage_PickUpDate_Invalid_error}                      //div[contains(text(),'Please provide valid Date.')]
${FormValidationPage_PaymentMethod_Invalid_error}                   //div[contains(text(),'Please select the Paymeny Method.')]

*** Keywords ***
Verify Expected Elements appear on Form Validation Page
    Wait Until Page Contains Element                                ${FormValidationPage_Title_text}               
    Wait Until Page Contains Element                                ${FormValidationPage_ContactName_input}        
    Wait Until Page Contains Element                                ${FormValidationPage_ContactNumber_input}      
    Wait Until Page Contains Element                                ${FormValidationPage_PickUpDate_input}         
    Wait Until Page Contains Element                                ${FormValidationPage_PaymentMethod_select}     
    Wait Until Page Contains Element                                ${FormValidationPage_Register_button}          
    Capture Page Screenshot

#Contact Name
Enter Contact Name
    [Arguments]        ${value}  
    Clear Element Text                                              ${FormValidationPage_ContactName_input} 
    Input Text          ${FormValidationPage_ContactName_input}     ${value}
    Capture Page Screenshot

Clear Contact Name    
    Clear Element Text                                              ${FormValidationPage_ContactName_input} 
    Capture Page Screenshot

Verify Empty Contact Name Error Appears
    Wait Until Element Is Visible                                   ${FormValidationPage_ContactName_Empty_error}
    Capture Page Screenshot

Verify Empty Contact Name Error Does Not Appear
    Wait Until Element Is Not Visible                               ${FormValidationPage_ContactName_Empty_error}
    Capture Page Screenshot

Verify Looks Good ContactName Message Appears
    Wait Until Element Is Visible                                   ${FormValidationPage_ContactName_LooksGood_message}
    Capture Page Screenshot

#Contact Number
Enter Contact Number
    [Arguments]        ${value}  
    Clear Element Text                                              ${FormValidationPage_ContactNumber_input} 
    Input Text          ${FormValidationPage_ContactNumber_input}   ${value}
    Capture Page Screenshot

Clear Contact Number    
    Clear Element Text                                              ${FormValidationPage_ContactNumber_input} 
    Capture Page Screenshot

Verify Invalid Contact Number Error Appears
    Wait Until Element Is Visible                                   ${FormValidationPage_ContactNumber_Invalid_error}
    Capture Page Screenshot

Verify Invalid Contact Number Error Does Not Appear
    Wait Until Element Is Not Visible                               ${FormValidationPage_ContactNumber_Invalid_error}
    Capture Page Screenshot

#PickUp Date
Enter PickUp Date
    [Arguments]        ${value}  
    Clear Element Text                                              ${FormValidationPage_PickUpDate_input} 
    Input Text          ${FormValidationPage_PickUpDate_input}      ${value}
    Capture Page Screenshot
   
Clear PickUp Date
    Clear Element Text                                              ${FormValidationPage_PickUpDate_input} 
    Capture Page Screenshot 

Verify Invalid PickUp Date Error Appears
    Wait Until Element Is Visible                                   ${FormValidationPage_PickUpDate_Invalid_error}
    Capture Page Screenshot

Verify Invalid PickUp Date Error Does Not Appear
    Wait Until Element Is Not Visible                               ${FormValidationPage_PickUpDate_Invalid_error}
    Capture Page Screenshot

#Payment Method
Select Payment Method
    [Arguments]        ${value}
    Select From List By Label             ${FormValidationPage_PaymentMethod_select}        ${value}
    Capture Page Screenshot

Verify Invalid Payment Method Error Appears
    Wait Until Element Is Visible                                   ${FormValidationPage_PaymentMethod_Invalid_error}
    Capture Page Screenshot

Verify Invalid Payment Method Error Does Not Appear
    Wait Until Element Is Not Visible                               ${FormValidationPage_PaymentMethod_Invalid_error}
    Capture Page Screenshot

#    //Register
Click Register
    Click Button                     ${FormValidationPage_Register_button}
    Capture Page Screenshot