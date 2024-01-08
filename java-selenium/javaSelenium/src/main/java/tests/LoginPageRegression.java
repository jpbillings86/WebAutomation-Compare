package tests;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

import pageObjects.loginPO;
import pageObjects.securePO;

public class LoginPageRegression {

    private WebDriver driver;

    @Before
    public void setUp() {
        System.setProperty("webdriver.chrome.driver", "C:\\Python\\Python39\\Scripts\\chromedriver.exe");
        driver = new ChromeDriver();
        driver.get("https://practice.expandtesting.com/login");
    	loginPO loginPage = new loginPO(driver);
        loginPage.VerifyExpectedElementsAppearOnLoginPage();
    }

    @Test
    public void LoginAsAValidUser() {
    	loginPO loginPage = new loginPO(driver);
    	loginPage.Login("practice", "SuperSecretPassword!");
    	securePO securePage = new securePO(driver);
    	securePage.VerifyExpectedElementsAppearOnSecurePage();
    }

    @Test
    public void AttemptToLoginWithAnInvalidUsername() {
    	loginPO loginPage = new loginPO(driver);
    	loginPage.Login("test", "SuperSecretPassword!");
    	loginPage.VerifyInvalidUsernameErrorAppears();
    }

    @Test
    public void AttemptToLoginWithAUsernameThatIsJustASpace() {
    	loginPO loginPage = new loginPO(driver);
    	loginPage.Login(" ", "SuperSecretPassword!");
    	loginPage.VerifyInvalidUsernameErrorAppears();
    }

    @Test
    public void 
    AttemptToLoginWithAnInvalidPassword() {
    	loginPO loginPage = new loginPO(driver);
    	loginPage.Login("practice", "123");
    	loginPage.VerifyInvalidPasswordErrorAppears();
    }

    @After
    public void tearDown() {
        if (driver != null) {
            driver.quit();
        }
    }
}