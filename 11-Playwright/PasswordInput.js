const { expect } = require('@playwright/test');

class PasswordInput {
  // Method for password validation tests
  async validationTest({ page }, passwordVal, passwordErr) {
    // Define locators for password input and error elements
    const passwordLocator = passwordVal;
    const errorLocator = passwordErr;

    // Click on the checkbox element
    await page.click('input[type="checkbox"]');
    
    // Locate the password input element and check its type attribute
    const passwordElement = await page.locator(passwordLocator);
    const classAttributeValue = await passwordElement.getAttribute('type');
    await expect(classAttributeValue).toContain('text');

    // Define an array of passwords for testing
    const passwords = [
      // Invalid data
      '1q2w3e4',
      'qwertyui',
      '12345678',
      '!@#$%^&*',
      'Password01;',
      // Valid data
      'tester1q',
      'qwertyui!',
      'q2345678',
      '!@#$%^&*q'
    ];

    // Loop through the passwords array and perform validation tests
    for (const password of passwords) {
      // Fill the password input field with the current password
      await page.fill(passwordLocator, password);
      console.log(`Password: ${password}`);
      
      // Simulate pressing the Tab key
      await page.keyboard.press('Tab');
      
      // Wait for a brief moment (1 second in this case)
      await page.waitForTimeout(1000);
      
      // Additional steps to bypass the bug (click and Tab)
      await page.click(passwordLocator);
      await page.keyboard.press('Tab');
      
      // Locate the error element associated with password validation
      const errorElement = await page.locator(errorLocator);

      // Perform different checks based on password criteria
      if (password.length < 8) {
        // Password length is less than 8 characters
        console.log(`1_Error: "${await errorElement.innerText()}"`);
        await expect(errorElement).toHaveText('At least 1 letter, a number or symbol, at least 8 characters.');
      } else if (/^(?=.*[a-zA-Z])(?!.*\d)(?!.*[!@#$%^&*(),.?":{}|<>])/.test(password)) {
        // Password does not contain a number or symbol
        console.log(`2_Error: "${await errorElement.innerText()}"`);
        await expect(errorElement).toHaveText('A number or symbol.');
      } else if (!/[a-zA-Z]/.test(password)) {
        // Password does not contain a letter
        console.log(`3_Error: "${await errorElement.innerText()}"`);
        await expect(errorElement).toHaveText('At least 1 letter.');
      } else if (/Password/.test(password)) {
        // Password contains the word 'Password'
        console.log(`4_Error: "${await errorElement.innerText()}"`);
        await expect(errorElement).toHaveText('Please make your password more unique.');
      } else {
        // Password passes other checks, check if error element is visible
        if (await errorElement.isVisible()) {
          console.log(`5_Error: "${await errorElement.innerText()}"`);
        }
      }
    }
  }
}

module.exports = new PasswordInput();