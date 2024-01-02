import loginPO from "../../pages/loginPO"
import securePO from "../../pages/securePO"

describe('Verify Login Page Elements', () => {
    beforeEach(() => {
        cy.visit('https://practice.expandtesting.com/login')
      })
    it('Verify Expected Elements appear on Login Page', () => {
        loginPO.Verify_Expected_Elements_Appear()
    })
  })

describe('Verify Login Page Security', () => {
    beforeEach(() => {
        cy.visit('https://practice.expandtesting.com/login')
      })
    it('Login as a valid user', () => {
        loginPO.Verify_Expected_Elements_Appear()
        loginPO.Login('practice','SuperSecretPassword!')
        securePO.Verify_Expected_Elements_Appear()
    })
    it('Attempt to login with an invalid username', () => {
        loginPO.Verify_Expected_Elements_Appear()
        loginPO.Login('Test','SuperSecretPassword!')
        loginPO.Verify_Invalid_Username_Error_Appears()
    })
    it('Attempt to login with a username that is just a space', () => {
        loginPO.Verify_Expected_Elements_Appear()
        loginPO.Login(" ",'SuperSecretPassword!')
        loginPO.Verify_Invalid_Username_Error_Appears()
    })
    it('Attempt to login with an invalid password', () => {
        loginPO.Verify_Expected_Elements_Appear()
        loginPO.Login('practice','123')
        loginPO.Verify_Invalid_Password_Error_Appears()
    })
  })