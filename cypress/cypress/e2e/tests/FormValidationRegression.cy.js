import formValidationPO from "../../pages/formValidationPO"

describe('Verify Form Validation Page Elements', () => {
  beforeEach(() => {
    cy.visit('https://practice.expandtesting.com/form-validation')
    })
  it('Verify Expected Elements appear on Form Validation Page', () => {
    formValidationPO.Verify_Expected_Elements_Appear()
  })
})

describe('Form Validation for Contact Name', () => {
  beforeEach(() => {
    cy.visit('https://practice.expandtesting.com/form-validation')
    formValidationPO.Verify_Expected_Elements_Appear()
    })
  it('Verify Empty Error message appears for Contact Name', () => {
     formValidationPO.Clear_ContactName()
     formValidationPO.Click_Register()
     formValidationPO.Verify_Empty_ContactName_Error_Appears()
  })
  it('Verify Looks Good message appears for Contact Name', () => {
     formValidationPO.Enter_ContactName('test')
     formValidationPO.Click_Register()
     formValidationPO.Verify_LooksGood_ContactName_Message_Appears()
     formValidationPO.Verify_Empty_ContactName_Error_Does_Not_Appear()
  })
})

describe('Form Validation for Contact Number', () => {
  beforeEach(() => {
    cy.visit('https://practice.expandtesting.com/form-validation')
    formValidationPO.Verify_Expected_Elements_Appear()
    })
  it('Verify Empty Error message does not appear for Contact Number with valid input', () => {
     formValidationPO.Enter_ContactNumber('123-1234567')
     formValidationPO.Click_Register()
     formValidationPO.Verify_Invalid_ContactNumber_Error_Does_Not_Appear()
  })
  it('Verify Invalid Error message appears for Contact Number when Empty', () => {
     formValidationPO.Clear_ContactNumber()
     formValidationPO.Click_Register()
     formValidationPO.Verify_Invalid_ContactNumber_Error_Appears()
  })
  it('Verify Invalid Error message appears for Contact Number with invalid input', () => {
    formValidationPO.Enter_ContactNumber('123')
     formValidationPO.Click_Register()
     formValidationPO.Verify_Invalid_ContactNumber_Error_Appears()
  })
})

describe('Form Validation for PickUp Date', () => {
  beforeEach(() => {
    cy.visit('https://practice.expandtesting.com/form-validation')
    formValidationPO.Verify_Expected_Elements_Appear()
    })
  it('Verify Empty Error message does not appear for PickUP Date with valid input', () => {
     formValidationPO.Enter_PickUpDate('1111-11-11')
     formValidationPO.Click_Register()
     formValidationPO.Verify_Invalid_Enter_PickUpDate_Error_Does_Not_Appear()
  })
  it('Verify Invalid Error message appears for PickUP Date when Empty', () => {
     formValidationPO.Clear_Enter_PickUpDate()
     formValidationPO.Click_Register()
     formValidationPO.Verify_Invalid_Enter_PickUpDate_Error_Appears()
  })
// TODO: Figure out how to force Cypress to type an invalid input into a Date field
//  it('Verify Invalid Error message appears for PickUP Date with invalid input', () => {
//    formValidationPO.Enter_PickUpDate('11')
//     formValidationPO.Click_Register()
//     formValidationPO.Verify_Invalid_Enter_PickUpDate_Error_Appears()
//  })
})

describe('Form Validation for PickUp Date', () => {
  beforeEach(() => {
    cy.visit('https://practice.expandtesting.com/form-validation')
    formValidationPO.Verify_Expected_Elements_Appear()
    })
  it('Verify Empty Error message does not appear for Payment Method when something is selected', () => {
     formValidationPO.Select_PaymentMethod('cash on delivery')
     formValidationPO.Click_Register()
     formValidationPO.Verify_Invalid_Enter_PaymentMethod_Error_Does_Not_Appear()
  })
  it('Verify Invalid Error message appears for Payment Method when Empty', () => {
     formValidationPO.Click_Register()
     formValidationPO.Verify_Invalid_Enter_PaymentMethod_Error_Appears()
  })
})