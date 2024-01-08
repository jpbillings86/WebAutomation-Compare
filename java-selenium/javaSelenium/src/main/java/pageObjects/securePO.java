package pageObjects;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class securePO {

	WebDriver driver;
	By SecurePage_Title_text=By.xpath("//h1[text()='Secure Area']");
	
	public securePO(WebDriver driver) {
		this.driver=driver;
	}
	
	public void VerifyExpectedElementsAppearOnSecurePage() {
		assertTrue(driver.findElement(SecurePage_Title_text).isDisplayed());
		
	}
}
