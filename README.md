# Web Automation Compare

This is a personal project to allow me to learn and compare various web automation tools and frameworks. My goal is to solve the exact same problem using various tools that are popular in the web automation world in order to give myself an overveiw of the strengths and weakness of various toolsets. I am also only using tools that are free and can be developed in an IDE such as VS Code or Eclipse.

Note: This experiment will be specific to web automation. I do have plans to do a similar project around API automation. I am also focusing on tools that are not point, click, and record solutions. 

- API Comparison Project: https://github.com/jpbillings86/APIAutomation_Compare


## Tools/Frameworks
The links below are to the test cases, not just the project file folder. This is simply to make it easier to compare the end result (test cases) of each project.
### Completed: 
- Robot Framework / Python - https://github.com/jpbillings86/WebAutomation-Compare/tree/main/robot-framework/tests
- Playwright / JS - https://github.com/jpbillings86/WebAutomation-Compare/tree/main/playwright/tests
- Cypress / JS - https://github.com/jpbillings86/WebAutomation-Compare/tree/main/cypress/cypress/e2e/tests
- Capybara/RSpec / Ruby - https://github.com/jpbillings86/WebAutomation-Compare/tree/main/capybara/spec/tests
- Selenium / Java - https://github.com/jpbillings86/WebAutomation-Compare/tree/main/java-selenium/javaSelenium/src/main/java/tests

### Planned
- Selenium / C#
- Appium / ???
- More options???

### Automation Approach
My plan is to use the Page Object Model (POM) to setup each framework. From experience, this methodology has proven the most maintainable and easieset to implement. The approach takes three steps:
1. Define the objects on a page. (links, inputs, buttons, images)
2. Define the actions I need to do with objects on a page. (click, type, verify exists/doesn't exist)
3. Define test cases used the objects and actions from first two steps.

Also worth noting, I am not using anything like Cucumber to avoid having to bring in extra libraries and packages for any given tool that doesn't support it out of the box. 

## Target Test Site

I will be using two pages from the following site: https://practice.expandtesting.com/

### Login Functionality
https://practice.expandtesting.com/login
#### Scenarios:
- Login as a Valid User
- Attempt to Login with an Invalid Username
- Attempt to Login with a Username that is just a space
- Attempt to login with an Invalid Password

### Form Validation
https://practice.expandtesting.com/form-validation
#### Scenarios:
- Verify Empty Error message appears for Contact Name
- Verify Looks Good message appears for Contact Name
- Verify Empty Error message does not appear for Contact Number with valid input
- Verify Invalid Error message appears for Contact Number when Empty
- Verify Invalid Error message appears for Contact Number with invalid input
- Verify Empty Error message does not appear for PickUp Date with valid input
- Verify Invalid Error message appears for PickUp Date when Empty
- Verify Invalid Error message appears for PickUp Date with invalid input
- Verify Empty Error message does not appear for Payment Method when something is selected
- Verify Invalid Error message appears for Payment Method when Empty

## Installation

ToDo: Need to create insturctions for each set of tools
