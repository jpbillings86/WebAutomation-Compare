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
    Verify No Error Messages Appear
    Capture Page Screenshot

Verify No Error Messages Appear
    Wait Until Page Does Not Contain Element                   ${LoginPage_UsernameRequired_text}
    Wait Until Page Does Not Contain Element                   ${LoginPage_PasswordRequired_text}
    Wait Until Page Does Not Contain Element                   ${LoginPage_CredientialsMatch_text}
    Wait Until Page Does Not Contain Element                   ${LoginPage_LockedOut_text}
    Capture Page Screenshot

Verify Username is required error message appears
    Wait Until Page Contains Element                           ${LoginPage_UsernameRequired_text} 
    Capture Page Screenshot

Verify Password is required error message appears
    Wait Until Page Contains Element                           ${LoginPage_PasswordRequired_text} 
    Capture Page Screenshot

Verify Credientials do not match error message appears
    Wait Until Page Contains Element                           ${LoginPage_CredientialsMatch_text} 
    Capture Page Screenshot

Verify User is locked out error message appears
    Wait Until Page Contains Element                           ${LoginPage_LockedOut_text} 
    Capture Page Screenshot

Enter Username into User Name field
    [Arguments]                ${username}
    Wait Until Page Contains Element                           ${LoginPage_Username_textbox} 
    Input Text                 ${LoginPage_Username_textbox}   ${username}

Enter Password into Password field
    [Arguments]                ${password}
    Wait Until Page Contains Element                           ${LoginPage_Password_textbox} 
    Input Text                 ${LoginPage_Password_textbox}   ${password}

Click Login button
    Wait Until Page Contains Element                           ${LoginPage_Login_button} 
    Click Element                                              ${LoginPage_Login_button} 

Log into Sauce Demo Site
    [Arguments]                 ${user}                        ${password}
    Verify Expected Elements appear on Login Page
    Enter Username into User Name field                        ${user}
    Enter Password into Password field                         ${password}
    Click Login button

Login as Standard User
    Log into Sauce Demo Site    ${Standard_User}               ${Default_PW}
    inventoryPO.Verify Expected Elements appear on Inventory Page

Attempt to Login as Locked Out User
    Enter Username into User Name field                        ${LockedOut_User}
    Enter Password into Password field                         ${Default_PW}
    Click Login button
    Verify User is locked out error message appears

Login as Problem User
    Log into Sauce Demo Site    ${Problem_User}                ${Default_PW}
    inventoryPO.Verify Expected Elements appear on Inventory Page

Login as Performance Glitch User
    Log into Sauce Demo Site    ${PerformanceGlitch_User}      ${Default_PW}
    inventoryPO.Verify Expected Elements appear on Inventory Page

Login as Error User
    Log into Sauce Demo Site    ${Error_User}                  ${Default_PW}
    inventoryPO.Verify Expected Elements appear on Inventory Page

Login as Visual User
    Log into Sauce Demo Site    ${Visual_User}                 ${Default_PW}
    inventoryPO.Verify Expected Elements appear on Inventory Page