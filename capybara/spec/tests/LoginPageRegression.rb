# spec/google_search_spec.rb
require_relative '../spec_helper'
require_relative '../pages/loginPO'
require_relative '../pages/securePO'

describe 'Verify Login Page Elements' do
  let(:loginPO) { LoginPO.new }
  before :each do
    loginPO.visit_page
  end
  it 'Verify Expected Elements appear on Login Page' do
    loginPO.Verify_Expected_Elements_Appear
  end
end

describe 'Verify Login Page Elements' do
  let(:loginPO) { LoginPO.new }
  let(:securePO) { SecurePO.new }
  before :each do
    loginPO.visit_page
  end
  it 'Login as a valid user' do
    loginPO.Verify_Expected_Elements_Appear
    loginPO.Login('practice','SuperSecretPassword!')
    securePO.Verify_Expected_Elements_Appear
  end
  it 'Attempt to login with an invalid username' do
    loginPO.Verify_Expected_Elements_Appear
    loginPO.Login('Test','SuperSecretPassword!')
    loginPO.Verify_Invalid_Username_Error_Appears
  end
  it 'Attempt to login with a username that is just a space' do
    loginPO.Verify_Expected_Elements_Appear
    loginPO.Login(" ",'SuperSecretPassword!')
    loginPO.Verify_Invalid_Username_Error_Appears
  end
  it 'Attempt to login with an invalid password' do
    loginPO.Verify_Expected_Elements_Appear
    loginPO.Login('practice','123')
    loginPO.Verify_Invalid_Password_Error_Appears
  end
end