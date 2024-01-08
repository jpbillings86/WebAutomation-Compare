package tests;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.WebDriverWait;

import pageObjects.formValidationPO;

public class FormValidationRegression {

    private WebDriver driver;

    @Before
    public void setUp() {
        System.setProperty("webdriver.chrome.driver", "C:\\Python\\Python39\\Scripts\\chromedriver.exe");
        driver = new ChromeDriver();
        driver.get("https://practice.expandtesting.com/form-validation ");
        formValidationPO formValidationPage = new formValidationPO(driver);
        formValidationPage.VerifyExpectedElementsAppearOnFormValidationPage();
    }

    //Contact Name
    @Test
    public void VerifyEmptyErrorMessageAppearsForContactName() {
        formValidationPO formValidationPage = new formValidationPO(driver);
        formValidationPage.ClearContactName();
        formValidationPage.ClickRegister();
        formValidationPage.VerifyEmptyContactNameErrorAppears();
        };

    @Test
    public void VerifyLooksGoodMessageAppearsForContactName() {
        formValidationPO formValidationPage = new formValidationPO(driver);
        formValidationPage.ClearContactName();
        formValidationPage.EnterContactName("test");
        formValidationPage.ClickRegister();
        formValidationPage.VerifyLooksGoodContactNameMessageAppears();
        };

    //Contact Number
    @Test
    public void VerifyEmptyErrorMessageDoesNotAppearForContactNumberWithValidInput() {
        formValidationPO formValidationPage = new formValidationPO(driver);
        formValidationPage.EnterContactNumber("123-1234567");   
        formValidationPage.ClickRegister();
        formValidationPage.VerifyInvalidContactNumberErrorDoesNotAppear();
        };

    @Test
    public void VerifyInvalidErrorMessageAppearsForContactNumberWhenEmpty() {
        formValidationPO formValidationPage = new formValidationPO(driver);
        formValidationPage.ClearContactNumber();
        formValidationPage.ClickRegister();
        formValidationPage.VerifyInvalidContactNumberErrorAppears();
        };

    @Test
    public void VerifyInvalidErrorMessageAppearsForContactNumberWithInvalidInput() {
        formValidationPO formValidationPage = new formValidationPO(driver);
        formValidationPage.EnterContactNumber("123");
        formValidationPage.ClickRegister();
        formValidationPage.VerifyInvalidContactNumberErrorAppears();
        };

    //PickUp Date
    @Test
    public void VerifyEmptyErrorMessageDoesNotAppearForPickUpDateWithValidInput() {
        formValidationPO formValidationPage = new formValidationPO(driver);
        formValidationPage.EnterPickUpDate("11/11/1111");     
        formValidationPage.ClickRegister();
        formValidationPage.VerifyInvalidPickUpDateErrorDoesNotAppear();
        };

    @Test
    public void VerifyInvalidErrorMessageAppearsForPickUpDateWhenEmpty() {
        formValidationPO formValidationPage = new formValidationPO(driver);
        formValidationPage.ClearPickUpDate();
        formValidationPage.ClickRegister();
        formValidationPage.VerifyInvalidPickUpDateErrorAppears();
        };

    @Test
    public void VerifyInvalidErrorMessageAppearsForPickUpDateWithInvalidInput() {
        formValidationPO formValidationPage = new formValidationPO(driver);
        formValidationPage.EnterPickUpDate("11");   
        formValidationPage.ClickRegister();
        formValidationPage.VerifyInvalidPickUpDateErrorAppears();
        };

    //Payment Method
    @Test
    public void VerifyEmptyErrorMessageDoesNotAppearForPaymentMethodWhenSomethingIsSelected() {
        formValidationPO formValidationPage = new formValidationPO(driver);
        formValidationPage.SelectPaymentMethod("cash on delivery"); 
        formValidationPage.ClickRegister();
        formValidationPage.VerifyInvalidPaymentMethodErrorDoesNotAppear();
        };

    @Test
    public void VerifyInvalidErrorMessageAppearsForPaymentMethodWhenEmpty() {
        formValidationPO formValidationPage = new formValidationPO(driver);
        formValidationPage.ClickRegister();
        formValidationPage.VerifyInvalidPaymentMethodErrorAppears();
        };
    
    @After
    public void tearDown() {
        if (driver != null) {
            driver.quit();
        }
    }
}