*** Settings ***
Library    Selenium2Library
Resource    ../resources.robot

*** Variables ***
${SecurePage_Title_text}                                        //h1[text()='Secure Area']

*** Keywords ***
Verify Expected Elements appear on Secure Page
    Wait Until Page Contains Element                           ${SecurePage_Title_text} 
    Capture Page Screenshot