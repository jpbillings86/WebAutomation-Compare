*** Settings ***
Library     Selenium2Library
Library     DateTime
Resource    settings.robot
Resource    resources.robot

*** Keywords ***
Launch Sauce Demo Site
    Set Selenium Timeout        ${SeleniumTimeout}
    Open Browser                ${baseURL}                      ${Browser}
    Set Window Size             ${WindowWidth}                  ${WindowHeight}   
    Verify Expected Elements appear on Login Page