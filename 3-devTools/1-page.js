module.exports = class Page {
    open (path) {
        return browser.url(`https://swanker.club/${path}`)
    }
}