const { test, expect } = require('@playwright/test');

test('Validation Test', async ({ page }) => {
  await page.goto('https://www.saucedemo.com')
});