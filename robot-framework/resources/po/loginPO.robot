*** Settings ***
Library    Selenium2Library
Resource    ../resources.robot

*** Variables ***
${LoginPage_Title_text}                                        //h1[text()='Login Page']
${LoginPage_Username_textbox}                                  //input[@id='username']      
${LoginPage_Password_textbox}                                  //input[@id='password']      
${LoginPage_Login_button}                                      //button[text()='Login']      
#Errors
${LoginPage_Error_InvalidUsername}                             //b[text()='Your username is invalid!']
${LoginPage_Error_InvalidPassword}                             //b[text()='Your password is invalid!']

*** Keywords ***
Verify Expected Elements appear on Login Page
    Wait Until Page Contains Element                           ${LoginPage_Title_text} 
    Wait Until Page Contains Element                           ${LoginPage_Username_textbox} 
    Wait Until Page Contains Element                           ${LoginPage_Password_textbox} 
    Wait Until Page Contains Element                           ${LoginPage_Login_button} 
    Capture Page Screenshot

Login 
    [Arguments]    ${username}    ${password}
    Input Text                     ${LoginPage_Username_textbox}      ${username}
    Input Text                     ${LoginPage_Password_textbox}      ${password}
    Click Button                   ${LoginPage_Login_button}
    Capture Page Screenshot

Verify Invalid Username Error Appears
    Wait Until Element Is Visible                              ${LoginPage_Error_InvalidUsername}
    Capture Page Screenshot

Verify Invalid Password Error Appears
    Wait Until Element Is Visible                              ${LoginPage_Error_InvalidPassword}                       
    Capture Page Screenshot