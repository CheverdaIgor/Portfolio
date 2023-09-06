const fs = require('fs');
const path = require('path');
const assert = require('assert');

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

    async clearJsonFile (filename) {
    fs.writeFile(filename, '[]', 'utf8', (err) => {
        if (err) {
          console.error('Error while clearing the file:', err);
        } else {
          console.log(`File "${filename}" has been cleared.`);
        }
    })}

    async strictEqualJsonFileСache () {
    let existingLogs = [];
        if (fs.existsSync(path.join(__dirname, 'cache.json'))) {
          const fileData = fs.readFileSync(path.join(__dirname, 'cache.json'), 'utf8');
          try {
            existingLogs = JSON.parse(fileData);
        } catch (error) {
            console.error('JSON parsing error:', error);
        }}
        assert.deepStrictEqual(existingLogs, []);
        /* for (let i = 0; i < existingLogs.length; i++) {
            const sourceSelectorValue = `${existingLogs[i].source}: ${existingLogs[i].selector}`;
            const messageValue = existingLogs[i].message;
        } */
    }

    async getLogsInJsonFile (elementSelector, caseName) {
        const logs = await browser.getLogs('browser');
        const logArray = [];
        logs.forEach(log => {
            const consoleDevtoolsLog = (`ConsoleDevtools: [${log.source}] [${log.message}]`);
            const logFile = {
                '0-caseName': caseName,
                '1-selector': elementSelector,
                '2-source': log.source,
                '3-consoleDevtools': log.message
            };
            logArray.push(logFile);
            console.log(consoleDevtoolsLog);
        });
        let existingLogs = [];
        for (let n1 = 1; n1 <= 2; n1++) {
            let filename = n1 === 1 ? path.join(__dirname, 'logs.json') : path.join(__dirname, 'cache.json');
            if (fs.existsSync(filename)) {
                const fileData = fs.readFileSync(filename, 'utf8');
                try {
                    existingLogs = JSON.parse(fileData);
                } catch (error) {
                    console.error('JSON parsing error:', error);
        }}
        const jsonData = JSON.stringify([...existingLogs, ...logArray], null, 2);
        fs.writeFile(filename, jsonData, 'utf8', (err) => {
            if (err) {
                console.error('Error writing logs to file:', err);
        }})}
    }
    
    async waitUntilisDisplayed (elementName, msg) {
        await browser.waitUntil(async function () {
        return (await elementName.isDisplayed()) === true
        }, {
        timeout: 1000,
        timeoutMsg: msg
    })}
    
    async textRemove (elementName) {
        await browser.execute((elementName) => {
            document.querySelector(elementName).remove()
        }, elementName)
    }
    
    async textContent (elementName, input) {
        await browser.execute((elementName, input) => {
            document.querySelector(elementName).textContent = input
        }, elementName, input)
    }

    async innerHTML (elementName, input) {
        await browser.execute((elementName, input) => {
            document.querySelector(elementName).innerHTML = input
        }, elementName, input)
    }
    
    async setAttributeNode (type1, num, type2, elementName) {
        await browser.execute((type1, num, type2, elementName) => {
            const attr = document.createAttribute(type2);
            attr.value = elementName;
            const h1 = document.getElementsByTagName(type1)[num];
            h1.setAttributeNode(attr);
        }, type1, num, type2, elementName)
    }
    
    async styleColor (elementName, input) {
        await browser.execute((elementName, input) => {
            document.querySelector(elementName).style.color = input
        }, elementName, input)
    }
    
    async closeWindow () {
        const parentWindow = await browser.getWindowHandle();
        const allWindows = await browser.getWindowHandles();
        for (const window of allWindows) {
            if (parentWindow != window){
                await browser.switchToWindow(window)
                await browser.closeWindow()
                await browser.switchToWindow(parentWindow)
    }}}
    
    async waitUntilisClickableBack(elementName, caseName) {
        try {
            await elementName.waitForClickable({timeout: 5000});
        } catch (error) {
            browser.back();
        }
        let elementSelector = elementName.selector;
        let elementNameSelector = (`Selector: ${elementName.selector}`);
        await elementName.click();
        let request = '';
        let responseStatus = '';
        await browser.cdp('Network', 'enable');
        await browser.on('Network.loadingFailed', (event) => {
            if (event.errorText != undefined) {
                request = `RequestFailed: [${event.errorText}] [${url}]`;
        }})
        await browser.on('Network.responseReceived', (event) => {
            const { status } = event.response;
            if (status >= 400 && status <= 599) {
                responseStatus = `ResponseFailed: [status: ${status}]`;
        }})
        await browser.pause(1000);
        await browser.waitUntil(async () => {
            const readyState = await browser.execute(() => document.readyState);
            return readyState === 'complete';
        })
        console.log(elementNameSelector, responseStatus, request);
        await this.getLogsInJsonFile (elementSelector, caseName)
        await browser.back();
        await browser.pause(1000);
    }
}
module.exports = new Helper();