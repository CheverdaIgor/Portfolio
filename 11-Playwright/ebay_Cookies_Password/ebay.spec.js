const { test, expect } = require('@playwright/test');
const CookieHandler = require('./CookieHandler');
const PasswordInput = require('./PasswordInput');

test.setTimeout(60000);

// Before each test, handle cookies and assert page title
test.beforeEach(async ({ context, page }) => {
  // Handle cookies for the specified URL using CookieHandler
  await CookieHandler.handleCookies({ context, page }, 'https://signup.ebay.com/pa/crte');
  // Assert that the page has the expected title
  await expect(page).toHaveTitle(/Register: Create a personal account/);
});

// Test for password validation
test('Password Validation Test', async ({ page }) => {
  // Call the validationTest method from PasswordInput module
  // Pass the page object and locators for password input and error elements
  await PasswordInput.validationTest({ page }, '#password', '#password_err');  
});