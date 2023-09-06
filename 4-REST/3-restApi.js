const MainPage = require('./2-main.page');
const PostTesting = require('./00-postTesting');

describe('Result:', () => {
    it('TestAPI', async () => {
        await MainPage.requestGetPost();
        await browser.pause(1000);
        await PostTesting.validatation();
    })
})