describe('SoftFarm', function () {
    it('Login/Logout', async () => {
        browser.url ('https://www.soft.farm/login')
        await $('[name="LoginForm[username]"]').setValue('testqa@test.tt')
        await $('[name="LoginForm[password]"]').setValue('qwerty12')
        await $('[name="login-button"]').click()  //LOGIN
        //await browser.keys("Enter")
        browser.maximizeWindow()  //розгорнути браузер
        //await $('[class="navbar-toggle"]').click()  //Button
        await browser.pause(1000)

        console.log(await $('[class="client__title"]').getText(), await $('[class="client__id"]').getText())
        console.log('MONEY:', await $$('#main-menu-right')[0].$$('li')[3].$('a').getText())
        const user = $$('#main-menu-right')[0].$$('li')[5].$('a')
        console.log('USER:', await user.getText())
        await user.click()  //USER
        await browser.pause(1000)
        
        const logout = await $$('#w9')[0].$$('li')[4].$('a')
        console.log('LOGOUT', await logout.getText())
        await logout.click()  //LOGOUT
    })
})