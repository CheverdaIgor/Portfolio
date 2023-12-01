const { test, expect } = require('@playwright/test');
const CookieHandler = require('./CookieHandler');
const OpenAIChat = require('./OpenAI');

test.setTimeout(120000);

test.beforeEach(async ({ context, page }) => {
  // Handle cookies before each test
  await CookieHandler.handleCookies({ context, page }, 'https://djinni.co/login?from=frontpage_main');
});

// Function to find and click the first job title without "You've applied"
const findAndClickFirstJobTitle = async (page) => {
  // Navigate to the jobs page
  await page.goto('https://djinni.co/jobs/?all-keywords=QA&keywords=QA');

  // Find job list items
  const elements = await page.$$('ul[class="list-unstyled list-jobs mb-4"] .job-list-item.position-relative');

  for (const element of elements) {
    // Check if the job has been applied
    const hasApplied = await element.$('.text-success:has-text("You\'ve applied")');
    if (!hasApplied) {
      // Click on the title element and break the loop
      const titleElement = await element.$('[class="h3 job-list-item__link"]');
      const titleText = await titleElement.innerText();
      console.log(titleText);
      await titleElement.click();
      break;
    }
  }
};

// Function to process elements and fill a message input field
async function processElements(page, selector, contextTextStart, contextTextEnd) {
  // Find elements matching the selector
  const elements = await page.$$(selector);

  for (const elementHandle of elements) {
    const textContent = await elementHandle.innerText();
    try {
      // Construct a question based on the provided context text
      const question = `${contextTextStart}: ${[textContent]} ${contextTextEnd}.`;
      console.log(question);
      const generatedText = await OpenAIChat.generation({ page }, question);
      await page.fill('#message', generatedText);
    } catch (error) {
      console.error("Error:", error);
    }
  }
}

/* test('New message in the Inbox', async ({ page }) => {
  // Navigate to the inbox page
  await page.goto('https://djinni.co/my/inbox/');

  // Find new messages elements
  const elements1 = await page.$$('[class="inbox-message col-sm-12 new-message"]');
  const elements2 = await page.$$('[class="inbox-message col-sm-12 new-message is-favorite"]');
  const combinedElements = [...elements1, ...elements2];
  
  for (const element of combinedElements) {
    // Extract attributes and job link
    const classAttributeDataCompany = await element.getAttribute('data-company');
    const classAttributeDataHref = await element.getAttribute('data-href');
    const jobLink = `https://djinni.co${classAttributeDataHref}`
    console.log(classAttributeDataCompany);
    console.log(jobLink);
    break;
  }

  // Navigate to the job link
  //await page.goto(jobLink);
  await page.goto('https://djinni.co/my/inbox/16980124/');

  // Process elements in the thread messages list
  await processElements(
    page,
    'div[class="thread-messages-list"]',
    'Контекст переписки',
    'Замість "You" напиши відповідь'
  );
}); */

test('Apply for the job', async ({ page }) => {
  // Click on the first job title without "You've applied" and navigate to the job details page
  await findAndClickFirstJobTitle(page);

  // Click on the "Apply for the job" button
  const applyForTheJob = await page.$('div[class="btn btn-primary d-block mb-3 js-inbox-toggle-reply-form"]');
  await applyForTheJob.click();

  // Process elements in the job details page
  await processElements(
    page,
    'div[class="col-sm-8 row-mobile-order-2"] > div[class="mb-4"]:first-of-type',
    'Опис вакансії',
    'Напиши свою відповідь за Ігоря'
  );
});