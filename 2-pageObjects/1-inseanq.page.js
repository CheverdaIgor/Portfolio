module.exports = class Page {
    open (path) {
        return browser.url(`https://qa1.inseanq.com/${path}`)
    }
}