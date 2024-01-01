*** Settings ***
Library     DateTime
Resource    resources.robot

*** Keywords ***
Launch Sauce Demo Site
    Open Browser                https://practice.expandtesting.com/login                    Chrome