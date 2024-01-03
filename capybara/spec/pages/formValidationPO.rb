# spec/formValidationPO.rb
class FormValidationPO
    include Capybara::DSL
    include RSpec::Matchers
  
    def initialize
       @FormValidationPage_Title_text = '//h1[text()=\'Form Validation\']' 
       @FormValidationPage_ContactName_input = '//input[@name=\'ContactName\']'
       @FormValidationPage_ContactNumber_input = '//input[@name=\'contactnumber\']'
       @FormValidationPage_PickUpDate_input = '//input[@name=\'pickupdate\']'
       @FormValidationPage_PaymentMethod_select = '//select[@name=\'payment\']'
       @FormValidationPage_Register_button = '//button[text()=\' Register \']'
       #Errors
       @FormValidationPage_ContactName_Empty_error = '//div[contains(text(),\'Please enter your Contact name.\')]'
       @FormValidationPage_ContactName_LooksGood_message = '//div[contains(text(),\'Looks good!\')]'
       @FormValidationPage_ContactNumber_Invalid_error = '//div[contains(text(),\'Please provide your Contact number.\')]'
       @FormValidationPage_PickUpDate_Invalid_error = '//div[contains(text(),\'Please provide valid Date.\')]'
       @FormValidationPage_PaymentMethod_Invalid_error = '//div[contains(text(),\'Please select the Paymeny Method.\')]'
    end

    def visit_page
      visit('https://practice.expandtesting.com/form-validation')
    end

    def Verify_Expected_Elements_Appear
      expect(find(:xpath, @FormValidationPage_Title_text).visible?).to be(true)
      expect(find(:xpath, @FormValidationPage_ContactName_input).visible?).to be(true)
      expect(find(:xpath, @FormValidationPage_ContactNumber_input).visible?).to be(true)
      expect(find(:xpath, @FormValidationPage_PickUpDate_input).visible?).to be(true)
      expect(find(:xpath, @FormValidationPage_PaymentMethod_select).visible?).to be(true)
      expect(find(:xpath, @FormValidationPage_Register_button).visible?).to be(true)
    end
    #Contact Name
    def Enter_ContactName(value)
      find(:xpath, @FormValidationPage_ContactName_input).set(value)
    end
    def Clear_ContactName
      find(:xpath, @FormValidationPage_ContactName_input).set('')
    end
    def Verify_Empty_ContactName_Error_Appears
      expect(find(:xpath, @FormValidationPage_ContactName_Empty_error).visible?).to be(true)
    end
    def Verify_Empty_ContactName_Error_Does_Not_Appear
      expect(page).not_to have_xpath(@FormValidationPage_ContactName_Empty_error)
    end
    def Verify_LooksGood_ContactName_Message_Appears
      expect(find(:xpath, @FormValidationPage_ContactName_LooksGood_message).visible?).to be(true)
    end
    #Contact Number
    def Enter_ContactNumber(value)
      find(:xpath, @FormValidationPage_ContactNumber_input).set(value)
    end
    def Clear_ContactNumber
      find(:xpath, @FormValidationPage_ContactNumber_input).set('')
    end
    def Verify_Invalid_ContactNumber_Error_Appears
      expect(find(:xpath, @FormValidationPage_ContactNumber_Invalid_error).visible?).to be(true)
    end
    def Verify_Invalid_ContactNumber_Error_Does_Not_Appear
      expect(page).not_to have_xpath(@FormValidationPage_ContactNumber_Invalid_error)
    end
    #PickUp Date
    def Enter_PickUpDate(value)
      find(:xpath, @FormValidationPage_PickUpDate_input).set(value)
    end
    def Clear_Enter_PickUpDate
      find(:xpath, @FormValidationPage_PickUpDate_input).set('')
    end
    def Verify_Invalid_Enter_PickUpDate_Error_Appears
      expect(find(:xpath, @FormValidationPage_PickUpDate_Invalid_error).visible?).to be(true)
    end
    def Verify_Invalid_Enter_PickUpDate_Error_Does_Not_Appear
      expect(page).not_to have_xpath(@FormValidationPage_PickUpDate_Invalid_error)
    end
    #Payment Method
    def Select_PaymentMethod(value)
      find(:xpath, @FormValidationPage_PaymentMethod_select).select(value)
    end
    def Verify_Invalid_Enter_PaymentMethod_Error_Appears
      expect(find(:xpath, @FormValidationPage_PaymentMethod_Invalid_error).visible?).to be(true)
    end
    def Verify_Invalid_Enter_PaymentMethod_Error_Does_Not_Appear
      expect(page).not_to have_xpath(@FormValidationPage_PaymentMethod_Invalid_error)
    end
    #Register
    def Click_Register
      find(:xpath, @FormValidationPage_Register_button).click
    end
  end