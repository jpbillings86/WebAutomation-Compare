*** Settings ***
Library    Selenium2Library
Resource    ../settings.robot
Resource    ../resources.robot

*** Variables ***
${LoginPage_Title_text}                                        //div[@class='login_logo']
${LoginPage_Username_textbox}                                  //input[@id='user-name']
${LoginPage_Password_textbox}                                  //input[@id='password']
${LoginPage_Login_button}                                      //input[@id='login-button']

#Errors
${LoginPage_UsernameRequired_text}                             //h3[text()='Epic sadface: Username is required']
${LoginPage_PasswordRequired_text}                             //h3[text()='Epic sadface: Password is required']
${LoginPage_CredientialsMatch_text}                            //h3[text()='Epic sadface: Username and password do not match any user in this service']
${LoginPage_LockedOut_text}                                    //h3[text()='Epic sadface: Sorry, this user has been locked out.']

*** Keywords ***
Verify Expected Elements appear on Login Page
    Wait Until Page Contains Element                           ${LoginPage_Title_text} 
    Wait Until Page Contains Element                           ${LoginPage_Username_textbox} 
    Wait Until Page Contains Element                           ${LoginPage_Password_textbox} 
    Wait Until Page Contains Element                           ${LoginPage_Login_button} 
    Wait Until Page Does Not Contain Element                   ${LoginPage_UsernameRequired_text}
    Wait Until Page Does Not Contain Element                   ${LoginPage_PasswordRequired_text}
    Wait Until Page Does Not Contain Element                   ${LoginPage_CredientialsMatch_text}
    Wait Until Page Does Not Contain Element                   ${LoginPage_LockedOut_text}
    Capture Page Screenshot