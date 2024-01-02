class securePO{
    elements ={
        SecurePage_Title_text : () => cy.xpath("//h1[text()='Secure Area']"),     
    }
    Verify_Expected_Elements_Appear(){
        this.elements.SecurePage_Title_text().should('be.visible')
    }   
}

module.exports = new securePO();

require('cypress-xpath')