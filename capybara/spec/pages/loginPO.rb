# spec/loginPO.rb
class LoginPO
    include Capybara::DSL
    include RSpec::Matchers
  
    def initialize 
      @LoginPage_Title_text = '//h1[text()=\'Login Page\']' 
      @LoginPage_Username_textbox = '//input[@id=\'username\']'       
      @LoginPage_Password_textbox = '//input[@id=\'password\']'       
      @LoginPage_Login_button = '//button[text()=\'Login\']'       
      #Errors
      @LoginPage_Error_InvalidUsername = '//b[text()=\'Your username is invalid!\']'  
      @LoginPage_Error_InvalidPassword = '//b[text()=\'Your password is invalid!\']'  
    end

    def visit_page
        visit('https://practice.expandtesting.com/login')
      end

    def Verify_Expected_Elements_Appear
      expect(find(:xpath, @LoginPage_Title_text ).visible?).to be(true)
      expect(find(:xpath, @LoginPage_Username_textbox ).visible?).to be(true)
      expect(find(:xpath, @LoginPage_Password_textbox ).visible?).to be(true)
      expect(find(:xpath, @LoginPage_Login_button ).visible?).to be(true)
    end

    def Login(username, password)
      find(:xpath, @LoginPage_Username_textbox).set(username)
      find(:xpath, @LoginPage_Password_textbox).set(password)
      find(:xpath, @LoginPage_Login_button).click
    end

    def Verify_Invalid_Username_Error_Appears
      expect(find(:xpath, @LoginPage_Error_InvalidUsername ).visible?).to be(true)
    end

    def Verify_Invalid_Password_Error_Appears
      expect(find(:xpath, @LoginPage_Error_InvalidPassword ).visible?).to be(true)
    end
  end