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
Verify Expected Elements appear on Login Page
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

Verify Invalid Username Error Appears
    Wait Until Element Is Visible                                   ${FormValidationPage_ContactName_LooksGood_message}
    Capture Page Screenshot

#    //Contact Number
#    Enter_ContactNumber(value) {
#        this.elements.FormValidationPage_ContactNumber_input().clear().type(value);
#    }
#    Clear_ContactNumber() {
#        this.elements.FormValidationPage_ContactNumber_input().clear();
#    }
#    Verify_Invalid_ContactNumber_Error_Appears(){
#        this.elements.FormValidationPage_ContactNumber_Invalid_error().should('be.visible');
#    }
#    Verify_Invalid_ContactNumber_Error_Does_Not_Appear(){
#        this.elements.FormValidationPage_ContactNumber_Invalid_error().should('not.be.visible');
#    }




#    //PickUp Date
#    Enter_PickUpDate(value) {
#        this.elements.FormValidationPage_PickUpDate_input().clear().type(value);
#    }
#    Clear_Enter_PickUpDate() {
#        this.elements.FormValidationPage_PickUpDate_input().clear();
#    }
#    Verify_Invalid_Enter_PickUpDate_Error_Appears(){
#        this.elements.FormValidationPage_PickUpDate_Invalid_error().should('be.visible');
#    }
#    Verify_Invalid_Enter_PickUpDate_Error_Does_Not_Appear(){
#        this.elements.FormValidationPage_PickUpDate_Invalid_error().should('not.be.visible');
#    }




#    //Payment Method
#    Select_PaymentMethod(value) {
#        this.elements.FormValidationPage_PaymentMethod_select().select(value);
#    }
#    Verify_Invalid_Enter_PaymentMethod_Error_Appears(){
#        this.elements.FormValidationPage_PaymentMethod_Invalid_error().should('be.visible');
#    }
#    Verify_Invalid_Enter_PaymentMethod_Error_Does_Not_Appear(){
#        this.elements.FormValidationPage_PaymentMethod_Invalid_error().should('not.be.visible');
#    }



#    //Register
#    Click_Register() {
#        this.elements.FormValidationPage_Register_button().click();
#    }