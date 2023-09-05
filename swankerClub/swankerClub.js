const Helper = require('./00-helper');
const MainPage = require('./2-main.page');

describe('Result:', () => {
    it('0-Welcome', async () => {
        await Helper.clearJsonFile('logs.json');
        await Helper.clearJsonFile('cache.json');
        await MainPage.open();
        await MainPage.main();
    })

    it('1-Menu', async () => {
        await browser.setWindowSize(500, 800);
        await MainPage.mainMenu();
        await Helper.strictEqualJsonFileСache();
    })
    
    it('2-MeetMarket', async () => {
        //await browser.maximizeWindow();
        await Helper.clearJsonFile('cache.json');
        await MainPage.mainMeetMarket();
        await Helper.strictEqualJsonFileСache();
    })

    it('3-CasesAndStories', async () => {
        await Helper.clearJsonFile('cache.json');
        await MainPage.mainCasesAndStories();
        await Helper.strictEqualJsonFileСache();
    })
    
    it('4-SponsoredContent', async () => {
        await Helper.clearJsonFile('cache.json');
        await MainPage.mainSponsoredContent();
        await Helper.strictEqualJsonFileСache();
    })

    it('5-UpcomingEvents', async () => {
        await Helper.clearJsonFile('cache.json');
        await MainPage.mainUpcomingEvents();
        await Helper.strictEqualJsonFileСache();
    })
    
    it('6-WhatsGoingOn', async () => {
        await Helper.clearJsonFile('cache.json');
        await MainPage.mainWhatsGoingOn();
        await Helper.strictEqualJsonFileСache();
    })
    
    it('7-BtnPage', async () => {
        await Helper.clearJsonFile('cache.json');
        await MainPage.mainBtnPage();
        await Helper.strictEqualJsonFileСache();
    })

    it('8-OurPartnersStories', async () => {
        await Helper.clearJsonFile('cache.json');
        await MainPage.mainOurPartnersStories();
        await Helper.strictEqualJsonFileСache();
    })

    it('9-SwFooter', async () => {
        await Helper.clearJsonFile('cache.json');
        await MainPage.mainSwFooter();
        await Helper.strictEqualJsonFileСache();
    })
})