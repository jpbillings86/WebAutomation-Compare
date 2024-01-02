const { expect } = require('@playwright/test');

exports.formValidationPO = class formValidationPO {
  /**
  * @param {import('@playwright/test').Page} page
  */
  constructor(page) {
  this.page = page;
  this.Title_text = page.locator("xpath=//h1[text()='Form Validation']");

  this.ContactName_input = page.locator("xpath=//input[@name='ContactName']");
  this.ContactNumber_input = page.locator("xpath=//input[@name='contactnumber']");
  this.PickUpDate_input = page.locator("xpath=//input[@name='pickupdate']");
  this.PaymentMethod_select = page.locator("xpath=//select[@name='payment']");
  this.Register_button = page.locator("xpath=//button[text()=' Register ']");
  //Errors
  this.ContactName_Empty_error = page.locator("xpath=//div[contains(text(),'Please enter your Contact name.')]");
  this.ContactName_LooksGood_message = page.locator("xpath=//div[contains(text(),'Looks good!')]");
  this.ContactNumber_Invalid_error = page.locator("xpath=//div[contains(text(),'Please provide your Contact number.')]");
  this.PickUpDate_Invalid_error = page.locator("xpath=//div[contains(text(),'Please provide valid Date.')]");
  this.PaymentMethod_Invalid_error = page.locator("xpath=//div[contains(text(),'Please select the Paymeny Method.')]");
  }
    
  async goto() {
    await this.page.goto('https://practice.expandtesting.com/form-validation');
    }

  async VerifyExpectedElementsAppearOnFormValidationPage() {
    await expect(this.Title_text).toBeVisible();
    await expect(this.ContactName_input).toBeVisible();
    await expect(this.ContactNumber_input).toBeVisible();
    await expect(this.PickUpDate_input).toBeVisible();
    await expect(this.PaymentMethod_select).toBeVisible();
    await expect(this.Register_button).toBeVisible();
    }

  //Contact Name
  async EnterContactName(value) {
    await this.ContactName_input.fill('');
    await this.ContactName_input.fill(value);
    }

  async ClearContactName() {
    await this.ContactName_input.fill('');
    }  

  async VerifyEmptyContactNameErrorAppears() {
    await expect(this.ContactName_Empty_error).toBeVisible();
    }

  async VerifyEmptyContactNameErrorDoesNotAppear() {
    await expect(this.ContactName_Empty_error).toBeHidden();
    }

  async VerifyLooksGoodContactNameMessageAppears() {
    await expect(this.ContactName_LooksGood_message).toBeVisible();
    }

  //Contact Number
  async EnterContactNumber(value) {
    await this.ContactNumber_input.fill('');
    await this.ContactNumber_input.fill(value);
  }

  async ClearContactNumber() {
    await this.ContactNumber_input.fill('');   
  }      

  async VerifyInvalidContactNumberErrorAppears() {
    await expect(this.ContactNumber_Invalid_error).toBeVisible();
  }  

  async VerifyInvalidContactNumberErrorDoesNotAppear() {
    await expect(this.ContactNumber_Invalid_error).toBeHidden();
  }  

  //PickUp Date
  async EnterPickUpDate(value) {
    await this.PickUpDate_input.fill('');
    await this.PickUpDate_input.fill(value);
  }      

  async ClearPickUpDate() {
    await this.PickUpDate_input.fill(''); 
  }    

  async VerifyInvalidPickUpDateErrorAppears() {
    await expect(this.PickUpDate_Invalid_error).toBeVisible();
  }    

  async VerifyInvalidPickUpDateErrorDoesNotAppear() {
    await expect(this.PickUpDate_Invalid_error).toBeHidden();
  }    

  //Payment Method
  async SelectPaymentMethod(value) {
    await this.PaymentMethod_select.selectOption(value);
  }    

  async VerifyInvalidPaymentMethodErrorAppears() {
    await expect(this.PaymentMethod_Invalid_error).toBeVisible();
  }    

  async VerifyInvalidPaymentMethodErrorDoesNotAppear() {
    await expect(this.PaymentMethod_Invalid_error).toBeHidden();
  }    

  //Register
  async ClickRegister() {
    await this.Register_button.click(); 
  }

  };