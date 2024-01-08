package pageObjects;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;

import static org.junit.jupiter.api.Assertions.assertTrue;

public class formValidationPO {

	WebDriver driver;	
	By FormValidationPage_Title_text=By.xpath("//h1[text()='Form Validation']");
	By FormValidationPage_ContactName_input=By.xpath("//input[@name='ContactName']");
	By FormValidationPage_ContactNumber_input=By.xpath("//input[@name='contactnumber']");
	By FormValidationPage_PickUpDate_input=By.xpath("//input[@name='pickupdate']");
	By FormValidationPage_PaymentMethod_select=By.xpath("//select[@name='payment']");
	By FormValidationPage_Register_button=By.xpath("//button[text()=' Register ']");
	//Errors
	By FormValidationPage_ContactName_Empty_error=By.xpath("//div[contains(text(),'Please enter your Contact name.')]");
	By FormValidationPage_ContactName_LooksGood_message=By.xpath("//div[contains(text(),'Looks good!')]");
	By FormValidationPage_ContactNumber_Invalid_error=By.xpath("//div[contains(text(),'Please provide your Contact number.')]");
	By FormValidationPage_PickUpDate_Invalid_error=By.xpath("//div[contains(text(),'Please provide valid Date.')]");
	By FormValidationPage_PaymentMethod_Invalid_error=By.xpath("//div[contains(text(),'Please select the Paymeny Method.')]");
	
	public formValidationPO(WebDriver driver) {
		this.driver=driver;
	}
	
	public void VerifyExpectedElementsAppearOnFormValidationPage() {
		assertTrue(driver.findElement(FormValidationPage_Title_text).isDisplayed());
		assertTrue(driver.findElement(FormValidationPage_ContactName_input).isDisplayed());
		assertTrue(driver.findElement(FormValidationPage_ContactNumber_input).isDisplayed());
		assertTrue(driver.findElement(FormValidationPage_PickUpDate_input).isDisplayed());
		assertTrue(driver.findElement(FormValidationPage_PaymentMethod_select).isDisplayed());
		assertTrue(driver.findElement(FormValidationPage_Register_button).isDisplayed());
	}

	//Contact Name
	public void EnterContactName(String value){
		driver.findElement(FormValidationPage_ContactName_input).clear();
		driver.findElement(FormValidationPage_ContactName_input).sendKeys(value);
	}
	
	public void ClearContactName() {
		driver.findElement(FormValidationPage_ContactName_input).clear();
	} 

	public void VerifyEmptyContactNameErrorAppears() {
		assertTrue(driver.findElement(FormValidationPage_ContactName_Empty_error).isDisplayed());
	}

	public void VerifyLooksGoodContactNameMessageAppears() {
		assertTrue(driver.findElement(FormValidationPage_ContactName_LooksGood_message).isDisplayed());
	}
	
	//Contact Number
	public void EnterContactNumber(String value) {
		driver.findElement(FormValidationPage_ContactNumber_input).clear();
		driver.findElement(FormValidationPage_ContactNumber_input).sendKeys(value);
	}

    public void ClearContactNumber () {   
		driver.findElement(FormValidationPage_ContactNumber_input).clear();
	}

    public void VerifyInvalidContactNumberErrorAppears() {
		assertTrue(driver.findElement(FormValidationPage_ContactNumber_Invalid_error).isDisplayed());
	}

    public void VerifyInvalidContactNumberErrorDoesNotAppear() {
		assertTrue(!driver.findElement(FormValidationPage_ContactNumber_Invalid_error).isDisplayed());
	}
    
	//PickUp Date
    public void EnterPickUpDate(String value) {
		driver.findElement(FormValidationPage_PickUpDate_input).clear();
		driver.findElement(FormValidationPage_PickUpDate_input).sendKeys(value);
    }
    
    public void ClearPickUpDate() {
		driver.findElement(FormValidationPage_PickUpDate_input).clear();
    }
    
    public void VerifyInvalidPickUpDateErrorAppears() {
		assertTrue(driver.findElement(FormValidationPage_PickUpDate_Invalid_error).isDisplayed());
	}
    
    public void VerifyInvalidPickUpDateErrorDoesNotAppear() {
		assertTrue(!driver.findElement(FormValidationPage_PickUpDate_Invalid_error).isDisplayed());
	}
    
	//Payment Method
	
	//Register
	public void ClickRegister() {
		driver.findElement(FormValidationPage_Register_button).click();
	}

	public void SelectPaymentMethod(String value) { 
		WebElement dropdownElement = driver.findElement(FormValidationPage_PaymentMethod_select);
		Select dropdownSelect = new Select(dropdownElement);
		dropdownSelect.selectByVisibleText(value);
	}

	public void VerifyInvalidPaymentMethodErrorDoesNotAppear() {
		assertTrue(!driver.findElement(FormValidationPage_PaymentMethod_Invalid_error).isDisplayed());
		
	}

	public void VerifyInvalidPaymentMethodErrorAppears() {
		assertTrue(driver.findElement(FormValidationPage_PaymentMethod_Invalid_error).isDisplayed());
		
	}
}
