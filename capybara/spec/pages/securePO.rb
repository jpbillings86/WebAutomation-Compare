# spec/securePO.rb
class SecurePO
    include Capybara::DSL
    include RSpec::Matchers
  
    def initialize
       @SecurePage_Title_text  = '//h1[text()=\'Secure Area\']' 
    end

    def Verify_Expected_Elements_Appear
      expect(find(:xpath, @SecurePage_Title_text ).visible?).to be(true)
    end
  end