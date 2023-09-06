class Helper {
    currentDate () {
        return new Date().toLocaleDateString().replaceAll(".", "/");
    }
    
    createRandomUserName() {
        return "Username" + Math.floor(Math.random() * 100000);
    }

    createRandomUserMail() {
        return this.createRandomUserName() + "@gmail.com";
    }

    createRandomNumber() {
        return Math.floor(Math.random() * 100000);
    }
    
    parseJsonFile (pathFile) {
        const fs = require('fs');
        const rawData = fs.readFileSync(pathFile);
        return JSON.parse(rawData);
    }
    
    async waitUntilisDisplayed (elementName, msg) {
        await browser.waitUntil(async function () {
        return (await elementName.isDisplayed()) === true
        }, {
        timeout: 1000,
        timeoutMsg: msg
    })}
}
module.exports = new Helper();