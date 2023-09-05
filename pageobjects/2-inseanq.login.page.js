const Helper = require('./00-helper');
const Page = require('./1-inseanq.page');
const PanelPage = require('./3-inseanq.panel.page');

class LoginPage extends Page {
    parseJson () {
        return Helper.parseJsonFile('./test/pageobjects/0-inseanq.json.json', 'utf8');
    }
    
    inputLoginAll (num) {
        return $(`(//*[@class="MuiInputBase-input MuiOutlinedInput-input jss28"])[${num}]`);
    }
    
    get btnSubmit () {
        return $('(//*[@class="MuiButton-label"])[1]');
    }
    
    async login () {
        //await browser.maximizeWindow()
        await this.inputLoginAll(1).setValue(this.parseJson().username);
        await this.inputLoginAll(2).setValue(this.parseJson().password);
        await this.btnSubmit.click();
        await browser.pause(1000);
        await Helper.waitUntilisDisplayed(PanelPage.btnBurger(), 'Expected btnBurger was not appeared after 1s.')
    }
    
    open () {
        return super.open(this.parseJson().path);
    }
}
module.exports = new LoginPage();