class formValidationPO{
    elements ={
        FormValidationPage_Title_text : () => cy.xpath("//h1[text()='Form Validation']"),
        FormValidationPage_ContactName_input : () => cy.xpath("//input[@name='ContactName']"),
        FormValidationPage_ContactNumber_input : () => cy.xpath("//input[@name='contactnumber']"),
        FormValidationPage_PickUpDate_input : () => cy.xpath("//input[@name='pickupdate']"),
        FormValidationPage_PaymentMethod_select : () => cy.xpath("//select[@name='payment']"),
        FormValidationPage_Register_button : () => cy.xpath("//button[text()=' Register ']"),
        //Errors
        FormValidationPage_ContactName_Empty_error : () => cy.xpath("//div[contains(text(),'Please enter your Contact name.')]"),
        FormValidationPage_ContactName_LooksGood_message : () => cy.xpath("//div[contains(text(),'Looks good!')]"),
        FormValidationPage_ContactNumber_Invalid_error : () => cy.xpath("//div[contains(text(),'Please provide your Contact number.')]"),
        FormValidationPage_PickUpDate_Invalid_error : () => cy.xpath("//div[contains(text(),'Please provide valid Date.')]"),
        FormValidationPage_PaymentMethod_Invalid_error : () => cy.xpath("//div[contains(text(),'Please select the Paymeny Method.')]"),
    }
    Verify_Expected_Elements_Appear(){
        this.elements.FormValidationPage_Title_text().should('be.visible');
        this.elements.FormValidationPage_ContactName_input().should('be.visible');
        this.elements.FormValidationPage_ContactNumber_input().should('be.visible');
        this.elements.FormValidationPage_PickUpDate_input().should('be.visible');
        this.elements.FormValidationPage_PaymentMethod_select().should('be.visible');
        this.elements.FormValidationPage_Register_button().should('be.visible');
    }
    //Contact Name
    Enter_ContactName(value) {
        this.elements.FormValidationPage_ContactName_input().clear().type(value);
    }
    Clear_ContactName() {
        this.elements.FormValidationPage_ContactName_input().clear();
    }
    Verify_Empty_ContactName_Error_Appears(){
        this.elements.FormValidationPage_ContactName_Empty_error().should('be.visible');
    }
    Verify_Empty_ContactName_Error_Does_Not_Appear(){
        this.elements.FormValidationPage_ContactName_Empty_error().should('not.be.visible');
    }
    Verify_LooksGood_ContactName_Message_Appears(){
        this.elements.FormValidationPage_ContactName_LooksGood_message().should('be.visible');
    }
    //Contact Number
    Enter_ContactNumber(value) {
        this.elements.FormValidationPage_ContactNumber_input().clear().type(value);
    }
    Clear_ContactNumber() {
        this.elements.FormValidationPage_ContactNumber_input().clear();
    }
    Verify_Invalid_ContactNumber_Error_Appears(){
        this.elements.FormValidationPage_ContactNumber_Invalid_error().should('be.visible');
    }
    Verify_Invalid_ContactNumber_Error_Does_Not_Appear(){
        this.elements.FormValidationPage_ContactNumber_Invalid_error().should('not.be.visible');
    }
    //PickUp Date
    Enter_PickUpDate(value) {
        this.elements.FormValidationPage_PickUpDate_input().clear().type(value);
    }
    Clear_Enter_PickUpDate() {
        this.elements.FormValidationPage_PickUpDate_input().clear();
    }
    Verify_Invalid_Enter_PickUpDate_Error_Appears(){
        this.elements.FormValidationPage_PickUpDate_Invalid_error().should('be.visible');
    }
    Verify_Invalid_Enter_PickUpDate_Error_Does_Not_Appear(){
        this.elements.FormValidationPage_PickUpDate_Invalid_error().should('not.be.visible');
    }
    //Payment Method
    Select_PaymentMethod(value) {
        this.elements.FormValidationPage_PaymentMethod_select().select(value);
    }
    Verify_Invalid_Enter_PaymentMethod_Error_Appears(){
        this.elements.FormValidationPage_PaymentMethod_Invalid_error().should('be.visible');
    }
    Verify_Invalid_Enter_PaymentMethod_Error_Does_Not_Appear(){
        this.elements.FormValidationPage_PaymentMethod_Invalid_error().should('not.be.visible');
    }
    //Register
    Click_Register() {
        this.elements.FormValidationPage_Register_button().click();
    }
}

module.exports = new formValidationPO();

require('cypress-xpath')