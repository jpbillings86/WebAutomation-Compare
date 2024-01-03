# spec/google_search_spec.rb
require_relative '../spec_helper'
require_relative '../pages/formValidationPO'

describe 'Verify Form Validation Page Elements' do
  let(:formValidationPO) { FormValidationPO.new }
  before :each do
    formValidationPO.visit_page
  end
  it 'Verify Expected Elements appear on Form Validation Page' do
    formValidationPO.Verify_Expected_Elements_Appear
  end
end

describe 'Form Validation for Contact Name' do
  let(:formValidationPO) { FormValidationPO.new }
  before :each do
    formValidationPO.visit_page
    formValidationPO.Verify_Expected_Elements_Appear
  end
  it 'Verify Empty Error message appears for Contact Name' do
    formValidationPO.Clear_ContactName
    formValidationPO.Click_Register
    formValidationPO.Verify_Empty_ContactName_Error_Appears
  end
  it 'Verify Looks Good message appears for Contact Name' do
    formValidationPO.Clear_ContactName
    formValidationPO.Enter_ContactName('test')
    formValidationPO.Click_Register
    formValidationPO.Verify_LooksGood_ContactName_Message_Appears
    formValidationPO.Verify_Empty_ContactName_Error_Does_Not_Appear
  end
end

describe 'Form Validation for Contact Number' do
  let(:formValidationPO) { FormValidationPO.new }
  before :each do
    formValidationPO.visit_page
    formValidationPO.Verify_Expected_Elements_Appear
  end
  it 'Verify Empty Error message does not appear for Contact Number with valid input' do
    formValidationPO.Enter_ContactNumber('123-1234567')
    formValidationPO.Click_Register
    formValidationPO.Verify_Invalid_ContactNumber_Error_Does_Not_Appear
  end
  it 'Verify Invalid Error message appears for Contact Number when Empty' do
    formValidationPO.Clear_ContactNumber
    formValidationPO.Click_Register
    formValidationPO.Verify_Invalid_ContactNumber_Error_Appears
  end
  it 'Verify Invalid Error message appears for Contact Number with invalid input' do
    formValidationPO.Enter_ContactNumber('123')
    formValidationPO.Click_Register
    formValidationPO.Verify_Invalid_ContactNumber_Error_Appears
  end
end

describe 'Form Validation for PickUp Date' do
  let(:formValidationPO) { FormValidationPO.new }
  before :each do
    formValidationPO.visit_page
    formValidationPO.Verify_Expected_Elements_Appear
  end
  it 'Verify Empty Error message does not appear for Contact Number with valid input' do
    formValidationPO.Enter_PickUpDate('1111-11-11')
    formValidationPO.Click_Register
    formValidationPO.Verify_Invalid_Enter_PickUpDate_Error_Does_Not_Appear
  end
  it 'Verify Invalid Error message appears for Contact Number when Empty' do
    formValidationPO.Clear_Enter_PickUpDate
    formValidationPO.Click_Register
    formValidationPO.Verify_Invalid_Enter_PickUpDate_Error_Appears
  end
  it 'Verify Invalid Error message appears for Contact Number with invalid input' do
    formValidationPO.Enter_PickUpDate('11')
    formValidationPO.Click_Register()
    formValidationPO.Verify_Invalid_Enter_PickUpDate_Error_Appears()
  end
end

describe 'Form Validation for Payment Method' do
  let(:formValidationPO) { FormValidationPO.new }
  before :each do
    formValidationPO.visit_page
    formValidationPO.Verify_Expected_Elements_Appear
  end
  it 'Verify Empty Error message does not appear for Payment Method when something is selected' do
    formValidationPO.Select_PaymentMethod('cash on delivery')
    formValidationPO.Click_Register
    formValidationPO.Verify_Invalid_Enter_PaymentMethod_Error_Does_Not_Appear
  end
  it 'Verify Invalid Error message appears for Payment Method when Empty' do
    formValidationPO.Click_Register
    formValidationPO.Verify_Invalid_Enter_PaymentMethod_Error_Appears
  end
end