const { expect } = require('@playwright/test');
const fs = require('fs');
const path = require('path');

class CookieHandler {
  async handleCookies({ context, page }, url) {
    // Define the file path for saving and retrieving cookies
    const cookiesFilePath = path.join(__dirname, 'cookies.json');

    // Check if the cookies file exists and is not empty
    if (fs.existsSync(cookiesFilePath) && fs.statSync(cookiesFilePath).size > 0) {
      // If the file exists and is not empty, load cookies from the file
      const savedCookies = JSON.parse(fs.readFileSync(cookiesFilePath, 'utf8'));
      await context.addCookies(savedCookies);
    } else {
      // If the file does not exist or is empty, perform a login and save the cookies
      await page.goto(url);
      await page.waitForTimeout(12000);
      // After successful login and captcha completion, retrieve cookies
      const cookies = await context.cookies();
      fs.writeFileSync(cookiesFilePath, JSON.stringify(cookies, null, 2));
    }

    // Check the presence of cookies before navigating to the specified URL
    const hasCookies = await context.cookies();
    // Assert that cookies are not null
    expect(hasCookies).not.toBeNull();

    // Navigate to the specified URL
    await page.goto(url);
  }
}

module.exports = new CookieHandler();