module.exports = class Page {
    open (path) {
        return browser.url(`https://petstore.swagger.io/v2/${path}`)
    }
}