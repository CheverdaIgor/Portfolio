const Page = require('./1-page');
const Helper = require('./00-helper');

class MainPage extends Page {
    parseJson () {
        return Helper.parseJsonFile('./test/swankerClub/0-json.json', 'utf8');
    }

    get forYour() {
        return (`[class='text-block mb-1'] h1`);
    }
    
    get upComing() {
        return (`[class='text-block mb-1'] p`);
    }

    btnBurger() {
        return $(`(//*[@class='sw-menu-toggle'])`);
    }
    
    menu(num1, num2, num3) {
        if (num1 === 1) {
            return $(`//*[@class='row g-0 sw-header-inner align-items-center']/div[1]/a`);
        }
        else if (num1 === 2) {
            if (num3 === 1) {
            return $(`//*[@class='offcanvas offcanvas-top d-lg-none show']/div[1]/nav/ul/li[${num2}]/a`);
        }
        else if (num3 === 2) {
            return $(`//*[@class='row g-0 sw-header-inner align-items-center']/div[2]/nav/ul/li[${num2}]/a`);
        }}
        else if (num1 === 3) {
            if (num3 === 1) {
            return $(`//*[@class='offcanvas offcanvas-top d-lg-none show']/div/div/a[${num2}]`);
        }
        else if (num3 === 2) {
            return $(`//*[@class='row g-0 sw-header-inner align-items-center']/div[3]/nav/a[${num2}]`);
        }}
        else if (num1 === 4) {
            if (num3 === 1) {
            return $(`//*[@class='offcanvas offcanvas-top d-lg-none show']/div/div[2]/ul/li[${num2}]/a`);
        }
        else if (num3 === 2) {
            return $(`//*[@class='row g-0 sw-header-inner align-items-center']/div[3]/div/ul/li[${num2}]/a`);
        }}
    }
    
    get btnClose() {
        return $(`//*[@class='btn-close']`);
    }
    
    colorCard(num) {
        return $(`(//*[@class='col-12 col-lg-6 '])[${num}]`);
    }

    casesAndStories(num1, num2, num3) {
        return $(`(//*[@class='sw-cards-row sw-cases-row row'])/div[${num1}]/article/${num2}/a[${num3}]`);
    }

    sponsoredContent(num) {
        return $(`(//*[@class='sw-card-outline'])[2]/div/div/div/div[${num}]/a`);
    }

    btnSponsoredContent(num) {
        return $(`(//*[@class='splide__pagination splide__pagination--ltr'])/li[${num}]/button`);
    }

    upcomingEvents(num1, num2, num3) {
        return $(`(//*[@class='col-12 col-lg-10 offset-lg-1'])/article[${num1}]/div[${num2}]/${num3}/a`);
    }

    whatsGoingOn(num1, num2, num3) {
        return $(`(//*[@id='splide01-list'])/div[${num1}]/article/${num2}/a[${num3}]`);
    }
    
    btnPage(num1) {
        return $(`(//*[@class='btn'])[${num1}]`);
    }
    
    ourPartnersStories(num1, num2) {
        return $(`(//*[@class='post-card link-card'])[${num1}]/a[${num2}]`);
    }
    
    swFooter(num1, num2) {
        return $(`//*[@class='sw-footer']/div/div/div[${num1}]/nav/ul/li[${num2}]/a`);
    }
    
    
    async main () {
        await Helper.setAttributeNode(this.parseJson().type1, this.parseJson().num, this.parseJson().type2, this.parseJson().elementName);
        await Helper.textContent(this.forYour, this.parseJson().forYour);
        await Helper.styleColor(this.forYour, this.parseJson().forYourColor);
        await Helper.textContent(this.upComing, this.parseJson().upComing);
        await Helper.styleColor(this.upComing, this.parseJson().upComingColor);
        await browser.pause(5000);
    }
    
    async mainMenu() {
        for (let n1 = 1; n1 <= 4; n1++) {
          for (let n2 = 1; n2 <= 6; n2++) {
            let elementName;            
            if (n1 === 1 && n2 === 1) {
                elementName = await this.menu(n1, n2);
                await elementName.click();
            } else if ((n1 === 2 && n2 <= 6) || (n1 === 3 && n2 <= 2) || (n1 === 4 && n2 <= 2)) {
                if (await this.btnBurger().isDisplayed()) {
                    await this.btnBurger().click()
                    elementName = await this.menu(n1, n2, 1)}
                else {
                    elementName = await this.menu(n1, n2, 2)}
                await Helper.waitUntilisClickableBack(elementName, 'Menu');
            }
          }
        }
    }
    
    async mainMeetMarket () {
        try {
            await this.btnClose.waitForClickable({
                timeout: 3000});
        } catch (error) {
            browser.back();
        }
        await browser.pause(1000);
        await this.btnClose.click();
        await browser.pause(1000);
        for (let n1 = 1; n1 <= 2; n1++) {
            const elementName = await this.colorCard(n1);
            await Helper.waitUntilisClickableBack(elementName, 'MeetMarket');
        }
    }
    
    async mainCasesAndStories () {
        for (let n1 = 1; n1 <= 3; n1++) {
            for (let n3 = 1; n3 <= 2; n3++) {
              const elementName1 = await this.casesAndStories(n1, '.', n3);
              await Helper.waitUntilisClickableBack(elementName1, 'CasesAndStories');          
              if (n3 === 1) {
                const elementName2 = await this.casesAndStories(n1, '*', 1);
                await Helper.waitUntilisClickableBack(elementName2, 'CasesAndStories');
              }
            }
        }
    }
    
    async mainSponsoredContent () {
        await Helper.waitUntilisClickableBack(await this.sponsoredContent(1), 'SponsoredContent');
        /* try {
            await this.btnSponsoredContent(2).waitForClickable({timeout: 3000});
        } catch (error) {
            browser.back();}
        await this.btnSponsoredContent(2).click();
        await this.sponsoredContent(2).click();
        await browser.pause(1000);
        await Helper.closeWindow(); */
    }
    
    async mainUpcomingEvents () {
        for (let n1 = 1; n1 <= 2; n1++) {
            for (let n2 = 1; n2 <= 2; n2++) {
              const elementName1 = await this.upcomingEvents(n1, n2, '.');
              await Helper.waitUntilisClickableBack(elementName1, 'UpcomingEvents');          
              if (n2 === 1) {
                const elementName2 = await this.upcomingEvents(n1, 2, '*');
                await Helper.waitUntilisClickableBack(elementName2, 'UpcomingEvents');
              }
            }
        }
    }

    async mainWhatsGoingOn () {
        for (let n1 = 1; n1 <= 6; n1++) {
            for (let n3 = 1; n3 <= 2; n3++) {
              const elementName1 = await this.whatsGoingOn(n1, '.', n3);
              await Helper.waitUntilisClickableBack(elementName1, 'WhatsGoingOn');
              if (n3 === 1) {
                const elementName2 = await this.whatsGoingOn(n1, '*', 1);
                await Helper.waitUntilisClickableBack(elementName2, 'WhatsGoingOn');
              }
            }
        }
    }
    
    async mainBtnPage () {
        for (let n1 = 1; n1 <= 5; n1++) {
            const elementName = await this.btnPage(n1);
            await Helper.waitUntilisClickableBack(elementName, 'BtnPage');
        }
    }
    
    async mainOurPartnersStories () {
        for (let n1 = 1; n1 <= 6; n1++) {
            for (let n2 = 1; n2 <= 2; n2++) {
              const elementName = await this.ourPartnersStories(n1, n2);
              await Helper.waitUntilisClickableBack(elementName, 'OurPartnersStories');
            }
        }
    }
    
    async mainSwFooter() {
        for (let n1 = 2; n1 <= 3; n1++) {
            for (let n2 = 1; n2 <= 6; n2++) {
                if (n1 === 3 && n2 === 4) break;
                const elementName = await this.swFooter(n1, n2);
                await Helper.waitUntilisClickableBack(elementName, 'SwFooter');
            }
        }
    }
    
    open () {
        return super.open('');
    }
}
module.exports = new MainPage();