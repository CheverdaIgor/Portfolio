describe('SoftFarm', function () {
    it('Login/Logout', async () => {
        browser.url ('https://www.soft.farm/login')
        await browser.pause(3000)

        await $('[name="LoginForm[username]"]').setValue('testqa@test.tt')
        await $('[name="LoginForm[password]"]').setValue('qwerty12')
        await browser.pause(5000)

        await $('[name="login-button"]').click()  //LOGIN
        //await browser.keys("Enter")
        await browser.pause(5000)

        console.log(await $('[class="client__title"]').getText(), await $('[class="client__id"]').getText())
        await $('[class="navbar-toggle"]').click()  //Button
        
        const text = await $$('#main-menu-right')[0]
        console.log('MONEY:', await text.$$('li')[3].$('a').getText())
        console.log('USER:', await text.$$('li')[5].$('a').getText())

        await text.$$('li')[5].$('a').click()  //USER
        
        const text2 = await $$('#w1')[0]
        console.log('LOGOUT', await text2.$$('li')[4].$('a').getText())
        await browser.pause(5000)

        await text2.$$('li')[4].$('a').click()  //LOGOUT
        await browser.pause(3000)
    })
})