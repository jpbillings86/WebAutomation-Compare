const { test, expect } = require('@playwright/test');
const { loginPO } = require('../po/loginPO');
const { securePO } = require('../po/securePO');

test.beforeEach(async ({ page }) => {
    const loginPage = new loginPO(page);
    await loginPage.goto();
    await loginPage.VerifyExpectedElementsAppearOnLoginPage();
  });

test('Login as a valid user', async ({ page }) => {
    const loginPage = new loginPO(page);
    await loginPage.Login('practice','SuperSecretPassword!');
    const securePage = new securePO(page);
    await securePage.VerifyExpectedElementsAppearOnSecurePage();
  });

test('Attempt to login with an invalid username', async ({ page }) => {
    const loginPage = new loginPO(page);
    await loginPage.Login('test','SuperSecretPassword!');
    await loginPage.VerifyInvalidUsernameErrorAppears();
  });

test('Attempt to login with a username that is just a space', async ({ page }) => {
    const loginPage = new loginPO(page);
    await loginPage.Login(' ','SuperSecretPassword!');
    await loginPage.VerifyInvalidUsernameErrorAppears();
  });

test('Attempt to login with an invalid password', async ({ page }) => {
    const loginPage = new loginPO(page);
    await loginPage.Login('practice','123');
    await loginPage.VerifyInvalidPasswordErrorAppears();
  });