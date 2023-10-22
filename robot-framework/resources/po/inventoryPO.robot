*** Settings ***
Library    Selenium2Library
Resource    ../settings.robot
Resource    ../resources.robot

*** Variables ***

*** Keywords ***
Verify Expected Elements appear on Inventory Page
    topBarPO.Verify Expected Elements appear on Top Bar

    footerPO.Verify Expected Elements appear on Footer
    Capture Page Screenshot