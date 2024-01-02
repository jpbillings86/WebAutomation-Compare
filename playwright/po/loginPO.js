const { expect } = require('@playwright/test');

exports.loginPO = class loginPO {
  /**
  * @param {import('@playwright/test').Page} page
  */
  constructor(page) {
  this.page = page;
  this.Title_text = page.locator("xpath=//h1[text()='Login Page']");
  this.Username_textbox = page.locator("xpath=//input[@id='username']");
  this.Password_textbox = page.locator("xpath=//input[@id='password']");
  this.Login_button = page.locator("xpath=//button[text()='Login']");
  //Errors
  this.Error_InvalidUsername = page.locator("xpath=//b[text()='Your username is invalid!']");
  this.Error_InvalidPassword = page.locator("xpath=//b[text()='Your password is invalid!']");
  }
    
  async goto() {
    await this.page.goto('https://practice.expandtesting.com/login');
    }

  async VerifyExpectedElementsAppearOnLoginPage() {
    await expect(this.Title_text).toBeVisible();
    await expect(this.Username_textbox).toBeVisible();
    await expect(this.Password_textbox).toBeVisible();
    await expect(this.Login_button).toBeVisible();
    }
   
  async Login(userName, password) {
    await this.Username_textbox.fill(userName);
    await this.Password_textbox.fill(password);
    await this.Login_button.click(); 
  }

  async VerifyInvalidUsernameErrorAppears() {
    await expect(this.Error_InvalidUsername).toBeVisible()
    }
 
  async VerifyInvalidPasswordErrorAppears() {
    await expect(this.Error_InvalidPassword).toBeVisible()
    }      
  };