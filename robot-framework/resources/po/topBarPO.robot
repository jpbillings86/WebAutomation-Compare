*** Settings ***
Library    Selenium2Library
Resource    ../settings.robot
Resource    ../resources.robot

*** Variables ***
${topBar_menu_link}                                                    //button[text()='Open Menu']
${topBar_title_text}                                                   //div[@class='app_logo']       
${topBar_cart_link}                                                    //a[@class='shopping_cart_link']

*** Keywords ***
Verify Expected Elements appear on Top Bar
    Wait Until Page Contains Element                           ${topBar_menu_link}
    Wait Until Page Contains Element                           ${topBar_title_text}
    Wait Until Page Contains Element                           ${topBar_cart_link}
    Capture Page Screenshot