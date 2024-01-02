const { expect } = require('@playwright/test');

exports.securePO = class securePO {
  /**
  * @param {import('@playwright/test').Page} page
  */
  constructor(page) {
  this.page = page;
  this.Title_text = page.locator("xpath=//h1[text()='Secure Area']");
  }

  async VerifyExpectedElementsAppearOnSecurePage() {
    await expect(this.Title_text).toBeVisible();
    } 
  };