import formValidationPO from "../../pages/formValidationPO"

describe('Verify Form Validation Page Elements', () => {
  beforeEach(() => {
    cy.visit('https://practice.expandtesting.com/form-validation')
    })
  it('Verify Expected Elements appear on Form Validation Page', () => {
    // tag: RegressionTest    
    // tag: FormValidation   
    formValidationPO.Verify_Expected_Elements_Appear()
  })
})

describe('Form Validation for Contact Name', () => {
  beforeEach(() => {
    cy.visit('https://practice.expandtesting.com/form-validation')
    formValidationPO.Verify_Expected_Elements_Appear()
    })
  it('Verify Empty Error message appears for Contact Name', () => {
    // tag: RegressionTest    
    // tag: FormValidation    
    // tag: ContactName
    formValidationPO.Clear_ContactName()
    formValidationPO.Click_Register()
    formValidationPO.Verify_Empty_ContactName_Error_Appears()
  })
  it('Verify Looks Good message appears for Contact Name', () => {
    // tag: RegressionTest    
    // tag: FormValidation    
    // tag: ContactName
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
    // tag: RegressionTest    
    // tag: FormValidation    
    // tag: ContactNumber
    formValidationPO.Enter_ContactNumber('123-1234567')
    formValidationPO.Click_Register()
    formValidationPO.Verify_Invalid_ContactNumber_Error_Does_Not_Appear()
  })
  it('Verify Invalid Error message appears for Contact Number when Empty', () => {
    // tag: RegressionTest    
    // tag: FormValidation    
    // tag: ContactNumber
    formValidationPO.Clear_ContactNumber()
    formValidationPO.Click_Register()
    formValidationPO.Verify_Invalid_ContactNumber_Error_Appears()
  })
  it('Verify Invalid Error message appears for Contact Number with invalid input', () => {
    // tag: RegressionTest    
    // tag: FormValidation    
    // tag: ContactNumber
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
  it('Verify Empty Error message does not appear for PickUp Date with valid input', () => {
    // tag: RegressionTest    
    // tag: FormValidation    
    // tag: PickUpDate
    formValidationPO.Enter_PickUpDate('1111-11-11')
    formValidationPO.Click_Register()
    formValidationPO.Verify_Invalid_Enter_PickUpDate_Error_Does_Not_Appear()
  })
  it('Verify Invalid Error message appears for PickUp Date when Empty', () => {
    // tag: RegressionTest    
    // tag: FormValidation    
    // tag: PickUpDate
    formValidationPO.Clear_Enter_PickUpDate()
    formValidationPO.Click_Register()
    formValidationPO.Verify_Invalid_Enter_PickUpDate_Error_Appears()
  })
// TODO: Figure out how to force Cypress to type an invalid input into a Date field
//  it('Verify Invalid Error message appears for PickUp Date with invalid input', () => {
//    // tag: RegressionTest    
//    // tag: FormValidation    
//    // tag: PickUpDate
//    formValidationPO.Enter_PickUpDate('11')
//     formValidationPO.Click_Register()
//     formValidationPO.Verify_Invalid_Enter_PickUpDate_Error_Appears()
//  })
})

describe('Form Validation for Payment Method', () => {
  beforeEach(() => {
    cy.visit('https://practice.expandtesting.com/form-validation')
    formValidationPO.Verify_Expected_Elements_Appear()
    })
  it('Verify Empty Error message does not appear for Payment Method when something is selected', () => {
    // tag: RegressionTest    
    // tag: FormValidation    
    // tag: PaymerntMethod
     formValidationPO.Select_PaymentMethod('cash on delivery')
     formValidationPO.Click_Register()
     formValidationPO.Verify_Invalid_Enter_PaymentMethod_Error_Does_Not_Appear()
  })
  it('Verify Invalid Error message appears for Payment Method when Empty', () => {
    // tag: RegressionTest    
    // tag: FormValidation    
    // tag: PaymerntMethod
     formValidationPO.Click_Register()
     formValidationPO.Verify_Invalid_Enter_PaymentMethod_Error_Appears()
  })
})