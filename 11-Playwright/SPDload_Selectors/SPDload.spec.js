const { test } = require('@playwright/test');
const selectors = require('./buttons.json');

test.setTimeout(120000);

test('Validation Test', async ({ page }) => {
  await page.goto('https://spdload.com/for-startups/web-development-services');

  for (const { name, selector } of selectors) {
    const elementHandle = await page.$(selector);

    if (name && name.trim() !== '') {
      console.log(`"${name}": '${selector}'`);
      if (['App development', 'Web development', 'MVP development', 'SaaS development', 'Marketplace development', 'UX/UI design', 'Discovery phase'].includes(name)) {
        await page.click('li#menu-item-6493 > a');
        await elementHandle.click();
      } else if (['Frontend developers', 'Backend developers', 'Mobile app developers'].includes(name)) {
        await page.click('li#menu-item-13818 > a');
        await elementHandle.click();
      } else if (!(await elementHandle.isVisible())) {
        console.log(`Element '${selector}' is not visible.`);
      } else {
        try {
          await elementHandle.click({ timeout: 1000 });
        } catch (error) {
          console.log(`Element '${selector}' is not clickable within 1 second.`);
        }
        await page.goto('https://spdload.com/for-startups/web-development-services');
        await page.waitForLoadState('domcontentloaded');
      }
    }
  }
});