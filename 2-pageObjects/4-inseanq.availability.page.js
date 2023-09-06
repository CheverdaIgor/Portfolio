const Helper = require('./00-helper');
const PanelPage = require('./3-inseanq.panel.page')

class AvailabilityPage {
    btnsAvailabilityAll (num) {
        return $(`(//*[@class="MuiButton-label"])[${num}]`);
    }

    inputsCreateAll (num) {
        return $(`(//*[@class="MuiFormControl-root MuiTextField-root"])[${num}]`);
    }

    get listProduct () {
        return $('(//*[@class="MuiList-root MuiMenu-list MuiList-padding"])[1]/li[1]');
    }

    get fieldComment () {
        return $('(//*[@class="MuiFormControl-root MuiTextField-root"])[5]/div/textarea');
    }

    fieldsDateAll (num) {
        return $(`(//*[@placeholder="DD/MM/YYYY"])[${num}]`);
    }
    
    async sectionAvailability () {
        await PanelPage.btnBurger().click();
        await browser.pause(1000);
        await PanelPage.sectionMenu(2).click();
        await browser.pause(1000);
    }
    
    async btnCreate () {
        await this.btnsAvailabilityAll(3).click();
        await browser.pause(1000);
        await this.inputsCreateAll(2).click();
        await browser.pause(1000);
        await this.listProduct.click();
        await browser.pause(1000);
        await this.fieldsDateAll(1).setValue(Helper.currentDate());
        await browser.pause(1000);
        await this.fieldComment.setValue(Helper.createRandomUserName());
        await browser.pause(1000);
    }
}
module.exports = new AvailabilityPage();