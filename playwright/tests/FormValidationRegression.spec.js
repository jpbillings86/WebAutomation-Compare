const { test, expect } = require('@playwright/test');
const { formValidationPO } = require('../po/formValidationPO');

test.beforeEach(async ({ page }) => {
    const formValidationPage = new formValidationPO(page);
    await formValidationPage.goto();
    await formValidationPage.VerifyExpectedElementsAppearOnFormValidationPage();
  });

//Contact Name
test('Verify Empty Error message appears for Contact Name', async ({ page }) => {
    const formValidationPage = new formValidationPO(page);
    await formValidationPage.ClearContactName();
    await formValidationPage.ClickRegister();
    await formValidationPage.VerifyEmptyContactNameErrorAppears();
  });

test('Verify Looks Good message appears for Contact Name', async ({ page }) => {
    const formValidationPage = new formValidationPO(page);
    await formValidationPage.EnterContactName('test');
    await formValidationPage.ClickRegister();
    await formValidationPage.VerifyLooksGoodContactNameMessageAppears();
  });

//Contact Number
test('Verify Empty Error message does not appear for Contact Number with valid input', async ({ page }) => {
    const formValidationPage = new formValidationPO(page);
    await formValidationPage.EnterContactNumber('123-1234567');
    await formValidationPage.ClickRegister();
    await formValidationPage.VerifyInvalidContactNumberErrorDoesNotAppear()
  });

test('Verify Invalid Error message appears for Contact Number when Empty', async ({ page }) => {
    const formValidationPage = new formValidationPO(page);
    await formValidationPage.ClearContactNumber();
    await formValidationPage.ClickRegister();
    await formValidationPage.VerifyInvalidContactNumberErrorAppears();
  });

test('Verify Invalid Error message appears for Contact Number with invalid input', async ({ page }) => {
    const formValidationPage = new formValidationPO(page);
    await formValidationPage.EnterContactNumber('123');
    await formValidationPage.ClickRegister();
    await formValidationPage.VerifyInvalidContactNumberErrorAppears();
  });

//PickUp Date
test('Verify Empty Error message does not appear for PickUp Date with valid input', async ({ page }) => {
    const formValidationPage = new formValidationPO(page);
    await formValidationPage.EnterPickUpDate('1111-11-11');
    await formValidationPage.ClickRegister();
    await formValidationPage.VerifyInvalidPickUpDateErrorDoesNotAppear();
  });

test('Verify Invalid Error message appears for PickUp Date when Empty', async ({ page }) => {
    const formValidationPage = new formValidationPO(page);
    await formValidationPage.ClearPickUpDate();
    await formValidationPage.ClickRegister();
    await formValidationPage.VerifyInvalidPickUpDateErrorAppears();
  });

// TODO: Figure out how to force Playwright to type an invalid input into a Date field
//test('Verify Invalid Error message appears for PickUp Date with invalid input', async ({ page }) => {
//    const formValidationPage = new formValidationPO(page);
//    await formValidationPage.EnterPickUpDate('11');
//    await formValidationPage.ClickRegister();
//    await formValidationPage.VerifyInvalidPickUpDateErrorAppears();
//
//  });

//Payment Method
test('Verify Empty Error message does not appear for Payment Method when something is selected', async ({ page }) => {
    const formValidationPage = new formValidationPO(page);
    await formValidationPage.SelectPaymentMethod('cash on delivery');
    await formValidationPage.ClickRegister();
    await formValidationPage.VerifyInvalidPaymentMethodErrorDoesNotAppear();
  });

test('Verify Invalid Error message appears for Payment Method when Empty', async ({ page }) => {
    const formValidationPage = new formValidationPO(page);
    await formValidationPage.ClickRegister();
    await formValidationPage.VerifyInvalidPaymentMethodErrorAppears();
  });