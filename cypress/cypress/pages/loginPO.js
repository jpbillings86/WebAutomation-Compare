class loginPO{
    elements ={
        LoginPage_Title_text : () => cy.xpath("//h1[text()='Login Page']"),
        LoginPage_Username_textbox : () => cy.xpath("//input[@id='username']"),       
        LoginPage_Password_textbox : () => cy.xpath("//input[@id='password']"),       
        LoginPage_Login_button : () => cy.xpath("//button[text()='Login']"),       
        //Errors
        LoginPage_Error_InvalidUsername : () => cy.xpath("//b[text()='Your username is invalid!']"),  
        LoginPage_Error_InvalidPassword : () => cy.xpath("//b[text()='Your password is invalid!']"),  
    }
    Verify_Expected_Elements_Appear(){
        this.elements.LoginPage_Title_text().should('be.visible')
        this.elements.LoginPage_Username_textbox().should('be.visible')
        this.elements.LoginPage_Password_textbox().should('be.visible')
        this.elements.LoginPage_Login_button().should('be.visible')
    }   
    Login(username, password) {
        this.elements.LoginPage_Username_textbox().type(username);
        this.elements.LoginPage_Password_textbox().type(password);
        this.elements.LoginPage_Login_button().click();
    }
    Verify_Invalid_Username_Error_Appears(){
        this.elements.LoginPage_Error_InvalidUsername().should('be.visible')
    }
    Verify_Invalid_Password_Error_Appears(){
        this.elements.LoginPage_Error_InvalidPassword().should('be.visible')
    }  
}

module.exports = new loginPO();

require('cypress-xpath')