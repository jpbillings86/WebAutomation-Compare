package pageObjects;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class loginPO {

	WebDriver driver;
	By LoginPage_Title_text=By.xpath("//h1[text()='Login Page']");
	By LoginPage_Username_textbox=By.xpath("//input[@id='username']");
	By LoginPage_Password_textbox=By.xpath("//input[@id='password']");
	By LoginPage_Login_button=By.xpath("//button[text()='Login']");
	//Errors
	By LoginPage_Error_InvalidUsername=By.xpath("//b[text()='Your username is invalid!']");
	By LoginPage_Error_InvalidPassword=By.xpath("//b[text()='Your password is invalid!']");
	
	public loginPO(WebDriver driver) {
		this.driver=driver;
	}
	
	public void VerifyExpectedElementsAppearOnLoginPage() {
		assertTrue(driver.findElement(LoginPage_Title_text).isDisplayed());
		assertTrue(driver.findElement(LoginPage_Username_textbox).isDisplayed());
		assertTrue(driver.findElement(LoginPage_Password_textbox).isDisplayed());
		assertTrue(driver.findElement(LoginPage_Login_button).isDisplayed());	
	}
	
	public void Login(String username, String password) {
		driver.findElement(LoginPage_Username_textbox).sendKeys(username);
		driver.findElement(LoginPage_Password_textbox).sendKeys(password);
		driver.findElement(LoginPage_Login_button).click();	
	}
	
	public void VerifyInvalidUsernameErrorAppears() {
		assertTrue(driver.findElement(LoginPage_Error_InvalidUsername).isDisplayed());
	}
	
	public void VerifyInvalidPasswordErrorAppears() {
		assertTrue(driver.findElement(LoginPage_Error_InvalidPassword).isDisplayed());
		}
}
