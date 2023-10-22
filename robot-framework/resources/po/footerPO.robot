*** Settings ***
Library    Selenium2Library
Resource    ../settings.robot
Resource    ../resources.robot

*** Variables ***
${footer_Twitter_link}                                         //li[@class='social_twitter']/a
${footer_Facebook_link}                                        //li[@class='social_facebook']/a
${footer_LinkedIn_link}                                        //li[@class='social_linkedin']/a
${footer_Copyright_text}                                       //div[@class='footer_copy']

*** Keywords *** 
Verify Expected Elements appear on Footer
    Wait Until Page Contains Element                           ${footer_Twitter_link}
    Wait Until Page Contains Element                           ${footer_Facebook_link}
    Wait Until Page Contains Element                           ${footer_LinkedIn_link}
    Wait Until Page Contains Element                           ${footer_Copyright_text}
    Capture Page Screenshot