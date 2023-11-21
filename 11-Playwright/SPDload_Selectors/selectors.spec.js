const path = require('path');
const fs = require('fs').promises;
const { test } = require('@playwright/test');

test('Generate selectors', async ({ page }) => {
  await page.goto('https://spdload.com/for-startups/web-development-services');

  //a[class="item"][href*="/"]
  //const elements = await page.$$('button.btn, a.btn');
  const elements = await page.$$('button, a');
  const buttons = [];

  for (const elementHandle of elements) {
    const name = await elementHandle.textContent();
    const selector = await page.evaluate((element) => {
      const path = [];
      while (element.nodeType === Node.ELEMENT_NODE) {
        let selector = element.nodeName.toLowerCase();
        if (element.id) {
          selector += `#${element.id}`;
          path.unshift(selector);
          break;
        } else {
          let sibling = element;
          let nth = 1;
          while (sibling.nodeType === Node.ELEMENT_NODE && sibling !== element) {
            if (sibling.nodeName.toLowerCase() === selector) {
              nth++;
            }
            sibling = sibling.previousSibling;
          }
          if (nth !== 1) {
            selector += `:nth-of-type(${nth})`;
          }
        }
        path.unshift(selector);
        element = element.parentNode;
      }
      return path.join(' > ');
    }, elementHandle);

    buttons.push({ name, selector });
  }
  const jsonPath = path.join(__dirname, 'buttons.json');
  await fs.writeFile(jsonPath, JSON.stringify(buttons, null, 2));

  console.log(`Buttons JSON saved to: ${jsonPath}`);
});