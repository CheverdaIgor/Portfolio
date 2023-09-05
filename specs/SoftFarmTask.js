const assert = require('assert');
const fs = require('fs');

describe('Результат:', function () {
    it('Login', async () => {
        browser.url ('https://www.soft.farm/login')  //перехід по url
        await $('[name="LoginForm[username]"]').setValue('testqa@test.tt')  //ввід 'E-mail'
        await $('[name="LoginForm[password]"]').setValue('qwerty12')  //ввід 'Пароль'
        await $('[name="login-button"]').click()  //клікнути 'Увійти'
        await browser.pause(3000)
    })
    
    it('перехід в "Розрахунок гонів"', async () => {
        if ($('[class="navbar-toggle"]').click()  //клікнути кнопку контекстного меню 'Burger'
        ){
        const menu = await $$('#main-menu')[0]  //вичитати 'main-menu'
        await menu.$$('li')[12].$('a').moveTo()  //обрати розділ 'Технологія'
        await browser.pause(1000)
        await menu.$$('li')[17].$('a').click()  //клікнути розділ 'Розрахунок гонів'
        browser.maximizeWindow()  //розгорнути браузер
        await browser.pause(2000)
        //await $$('[name="landPlotId"]')[0].selectByAttribute('value', '153745')  //вибрати 'Ділянка 1 га' без відкриття комбобоксу
    }})

    it('обовязковість полів, ввід символів', async () => {
        await $('#w0').setValue('eng')  //заповнити поле 'Ширина причепа'
        await $('#w1').setValue('-')  //заповнити поле 'Споживання матеріалів'
        await $('#w2').setValue('укр')  //заповнити поле 'Об'єм бункера'
        await $('[class="btn btn-primary calculate-gons"]').click()  //клікнути 'Розрахувати'
        const landPlotId = await $$('[class="form-wrap"]')[0].$$('div')[1]  //вичитати помилку
        expect(await landPlotId.getAttribute('class')).toEqual('form-group full-width has-error')  //поле 'Ділянка' обов'язкове
        const w0 = await $$('[class="gons-data-block"]')[0].$$('div')[0]  //вичитати помилку
        expect(await w0.getAttribute('class')).toEqual('form-group has-error')  //поле 'Ширина причепа' обов'язкове
        const w1 = await $$('[class="gons-data-block"]')[0].$$('div')[1]  //вичитати помилку
        expect(await w1.getAttribute('class')).toEqual('form-group has-error')  //поле 'Споживання матеріалів' обов'язкове
        const w2 = await $$('[class="gons-data-block"]')[0].$$('div')[2]  //вичитати значення
        expect(await w2.getAttribute('class')).toEqual('form-group')  //поле 'Об'єм бункера' НЕ обов'язкове
        expect(await $('#w2').getValue()).toEqual('')  //поле 'Об'єм бункера' пусте
        await browser.pause(2000)
        
        await $('#w0').setValue('11')  //заповнити поле 'Ширина причепа'
        await $('#w1').setValue('12')  //заповнити поле 'Споживання матеріалів'
        await $('#w2').setValue('13')  //заповнити поле 'Об'єм бункера'
        await $('[class="btn btn-primary calculate-gons"]').click()  //клікнути 'Розрахувати'
        const landPlotId1 = await $$('[class="form-wrap"]')[0].$$('div')[1]  //вичитати помилку
        expect(await landPlotId1.getAttribute('class')).toEqual('form-group full-width has-error')  //поле 'Ділянка' обов'язкове
        await browser.pause(2000)
    })

    it('граничні значення', async () => {
        await $('[class="select2-selection select2-selection--single"]').click()  //клікнути випадаючий список 'Ділянка'
        const scroll = await $$('[class="select2-results__options"]')[0]  //вичитати випадаючий список 'Ділянка'
        await scroll.$$('li')[9].scrollIntoView()  //скролінг випадаючого списку 'Ділянка'
        await scroll.$$('li')[19].moveTo()  //вибрати 'Ділянка 1 га'
        await scroll.$$('li')[19].click()  //клікнути 'Ділянка 1 га'
        await browser.pause(1000)
        await $('[class="btn btn-primary calculate-gons"]').click()  //клікнути 'Розрахувати'
        const w01 = await $$('[class="gons-data-block"]')[0].$$('div')[0]  //вичитати помилку
        expect(await w01.getAttribute('class')).toEqual('form-group has-error')  //поле 'Ширина причепа' обов'язкове
        const w11 = await $$('[class="gons-data-block"]')[0].$$('div')[1]  //вичитати помилку
        expect(await w11.getAttribute('class')).toEqual('form-group has-error')  //поле 'Споживання матеріалів' обов'язкове
        const w21 = await $$('[class="gons-data-block"]')[0].$$('div')[2]  //вичитати значення
        expect(await w21.getAttribute('class')).toEqual('form-group')  //поле 'Об'єм бункера' НЕ обов'язкове
        expect(await $('#w2').getValue()).toEqual('')  //поле 'Об'єм бункера' пусте
        await browser.pause(2000)
        
        await $('#w0').setValue('0')  //заповнити поле 'Ширина причепа'
        await $('#w1').setValue('0')  //заповнити поле 'Споживання матеріалів'
        await $('#w2').setValue('0')  //заповнити поле 'Об'єм бункера'
        await $('[class="btn btn-primary calculate-gons"]').click()  //клікнути 'Розрахувати'
        const landPlotId2 = await $$('[class="form-wrap"]')[0].$$('div')[1]  //вичитати значення
        expect(await landPlotId2.getAttribute('class')).toEqual('form-group full-width')  //правильне значення поля 'Ділянка'
        const w02 = await $$('[class="gons-data-block"]')[0].$$('div')[0]  //вичитати помилку
        expect(await w02.getAttribute('class')).toEqual('form-group has-error')  //НЕправильне значення поля 'Ширина причепа'
        const w12 = await $$('[class="gons-data-block"]')[0].$$('div')[1]  //вичитати помилку
        expect(await w12.getAttribute('class')).toEqual('form-group has-error')  //НЕправильне значення поля 'Споживання матеріалів'
        const w22 = await $$('[class="gons-data-block"]')[0].$$('div')[2]  //вичитати значення
        expect(await w22.getAttribute('class')).toEqual('form-group')  //правильне значення поля 'Об'єм бункера'
        await browser.pause(2000)

        await $('#w0').setValue('0.01')  //заповнити поле 'Ширина причепа'
        await $('#w1').setValue('0.01')  //заповнити поле 'Споживання матеріалів'
        await $('#w2').setValue('0.01')  //заповнити поле 'Об'єм бункера'
        await $('[class="btn btn-primary calculate-gons"]').click()  //клікнути 'Розрахувати'
        const w04 = await $$('[class="gons-data-block"]')[0].$$('div')[0]  //вичитати значення
        expect(await w04.getAttribute('class')).toEqual('form-group')  //правильне значення поля 'Ширина причепа'
        const w14 = await $$('[class="gons-data-block"]')[0].$$('div')[1]  //вичитати значення
        expect(await w14.getAttribute('class')).toEqual('form-group')  //правильне значення поля 'Споживання матеріалів'
        const w24 = await $$('[class="gons-data-block"]')[0].$$('div')[2]  //вичитати значення
        expect(await w24.getAttribute('class')).toEqual('form-group')  //правильне значення поля 'Об'єм бункера'
        await browser.pause(2000)
        
        await $('#w0').setValue('50.01')  //заповнити поле 'Ширина причепа'
        await $('#w1').setValue('10000')  //заповнити поле 'Споживання матеріалів'
        await $('#w2').setValue('10000')  //заповнити поле 'Об'єм бункера'
        await $('[class="btn btn-primary calculate-gons"]').click()  //клікнути 'Розрахувати'
        const w03 = await $$('[class="gons-data-block"]')[0].$$('div')[0]  //вичитати помилку
        expect(await w03.getAttribute('class')).toEqual('form-group has-error')  //НЕправильне значення поля 'Ширина причепа'
        const w13 = await $$('[class="gons-data-block"]')[0].$$('div')[1]  //вичитати помилку
        expect(await w13.getAttribute('class')).toEqual('form-group has-error')  //НЕправильне значення поля 'Споживання матеріалів'
        const w23 = await $$('[class="gons-data-block"]')[0].$$('div')[2]  //вичитати помилку
        expect(await w23.getAttribute('class')).toEqual('form-group has-error')  //НЕправильне значення поля 'Об'єм бункера'
        await browser.pause(2000)

        await $('#w0').setValue('50')  //заповнити поле 'Ширина причепа'
        await $('#w1').setValue('9999.99')  //заповнити поле 'Споживання матеріалів'
        await $('#w2').setValue('9999.99')  //заповнити поле 'Об'єм бункера'
        await $('[class="btn btn-primary calculate-gons"]').click()  //клікнути 'Розрахувати'
        const w05 = await $$('[class="gons-data-block"]')[0].$$('div')[0]  //вичитати значення
        expect(await w05.getAttribute('class')).toEqual('form-group')  //правильне значення поля 'Ширина причепа'
        const w15 = await $$('[class="gons-data-block"]')[0].$$('div')[1]  //вичитати значення
        expect(await w15.getAttribute('class')).toEqual('form-group')  //правильне значення поля 'Споживання матеріалів'
        const w25 = await $$('[class="gons-data-block"]')[0].$$('div')[2]  //вичитати значення
        expect(await w25.getAttribute('class')).toEqual('form-group')  //правильне значення поля 'Об'єм бункера'
        await browser.pause(1000)
    })
    
    it('збереження гона, без поля "Обєм бункера"', async () => {
        money1 = await $$('#main-menu-right')[0].$$('li')[3].$('a').getText()  //вичитати гроші
        money11 = money1.replace(/\s/g, '')  //прибрати пробіл з числа
        assert.ok(money11 >= 30)  //перевірити рахунок на 30 коп

        await $('#w2').clearValue()  //очищення поля 'Об'єм бункера'
        await browser.pause(2000)
        const response = await browser.mock('**/create', {method: 'post'})  //слухати response
        await $('[class="btn btn-primary create-gon-info"]').click()  //клікнути 'Зберегти'
        await browser.pause(1000)
        expect(response.matches[0].statusCode).toEqual(302)  //порівняти statusCode з 302
    })

    it('карта: "Вїзд", "Напрямок"', async () => {
        await browser.back()
        await browser.pause(2000)
        const elem1 = await $('#map div div div:nth-child(2) div:nth-child(2) div div:nth-child(3) div:nth-child(2)')  //карта 'В'їзд'
        expect(await elem1.getAttribute('aria-label')).toBeExisting()  //'В'їзд' на карті присутній
        const elem2 = await $('#map div div div:nth-child(2) div:nth-child(2) div div:nth-child(3) div:nth-child(3)')  //карта 'Напрямок'
        expect(await elem2.getAttribute('aria-label')).toBeExisting()  //'Напрямок' на карті присутній
        await browser.pause(1000)
        browser.execute($('#map div div div:nth-child(2) div:nth-child(2) div div:nth-child(3) div:nth-child(3)').dragAndDrop({ x: 200, y: 200 }))  //переміщення на карті 'Напрямок'
        await $('#map div div div:nth-child(2) div:nth-child(2) div div:nth-child(3) div:nth-child(2)').dragAndDrop({ x: -547, y: 55 })  //переміщення на карті 'В'їзд'
        await $('#map div div div:nth-child(2) div:nth-child(2) div div:nth-child(3) div:nth-child(2)').click()  //клікнути 'В'їзд'
    })

    it('розрахунок гона', async () => {
        await $('#w0').setValue('1')  //заповнити поле 'Ширина причепа'
        await $('#w1').setValue('10')  //заповнити поле 'Споживання матеріалів'
        await $('#w2').setValue('2.51')  //заповнити поле 'Об'єм бункера'
        await browser.pause(1000)

        const bunkerVolume = await $$('[name="bunkerVolumeUnit"]')[0]  //вичитати випадаючий список 'л/кг'
        await bunkerVolume.click()  //клікнути випадаючий список 'л/кг'
        await bunkerVolume.$$('option')[1].click()  //клікнути 'кг'
        await bunkerVolume.click()  //клікнути випадаючий список 'л/кг'
        await browser.pause(1000)
        await $('[class="btn btn-primary calculate-gons"]').click()  //клікнути 'Розрахувати'
    })

    it('результат розрахунку', async () => {
        await expect(await $$('#calculation-of-runs')[0].$$('section')[1].$$('div')[1].$('span')).toHaveTextContaining('169.97')  //Азимут: '169.97'
        await expect(await $$('#calculation-of-runs')[0].$$('section')[1].$$('div')[3].$('span')).toHaveTextContaining('50.44211')  //Широта: '50.44211'
        await expect(await $$('#calculation-of-runs')[0].$$('section')[1].$$('div')[4].$('span')).toHaveTextContaining('30.14684')  //Довгота: '30.14684'
        await expect(await $$('#calculation-of-runs')[0].$$('section')[1].$$('div')[5].$('span')).toHaveTextContaining('10.11')  //Відстань: '10.11 км'
        await expect(await $$('#calculation-of-runs')[0].$$('section')[1].$$('div')[6].$('span')).toHaveTextContaining('1.00 га')  //Площа ділянки: '1.00 га'
        await expect(await $$('#calculation-of-runs')[0].$$('section')[1].$$('div')[7].$('span')).toHaveTextContaining('10.11 кг')  //Загальне споживання: '10.11 кг'
        await expect(await $$('#calculation-of-runs')[0].$$('section')[1].$$('div')[8].$('span')).toHaveTextContaining('10.00 кг/га')  //Норма: '10.00 кг/га'
        await expect(await $$('#calculation-of-runs')[0].$$('section')[1].$$('div')[9].$('span')).toHaveTextContaining('5')  //Кількість заправок: '5'
        await expect(await $$('#calculation-of-runs')[0].$$('section')[1].$$('div')[10].$('span')).toHaveTextContaining('0.07 кг')  //Остання заправка: '0.07 кг'
    })

    xit('збереження гона, з полем "Обєм бункера"', async () => {
       money2 = await $$('#main-menu-right')[0].$$('li')[3].$('a').getText()  //вичитати гроші
       money22 = money2.replace(/\s/g, '')  //прибрати пробіл з числа
       assert.ok(money22 >= 30)  //перевірити рахунок на 30 коп

       const response2 = await browser.mock('**/create', {method: 'post'})  //слухати response
       await $('[class="btn btn-primary create-gon-info"]').click()  //клікнути 'Зберегти'
       await browser.pause(1000)
       expect(response2.matches[0].statusCode).toEqual(302)  //порівняти statusCode з 302
    })

    it('перегляд збереженого гона', async () => {
        await browser.back()
        await browser.pause(2000)
        await $$('[class="table table-bordered"]')[0].$$('tbody')[0].$$('tr')[0].$$('td')[1].$('a').click()  //клікнути 'Показати'
        await browser.pause(1000)
        await expect(await $$('#calculation-of-runs')[0].$$('section')[1].$$('div')[1].$('span')).toHaveTextContaining('169.97')  //Азимут: '169.97'
        await expect(await $$('#calculation-of-runs')[0].$$('section')[1].$$('div')[3].$('span')).toHaveTextContaining('50.44211')  //Широта: '50.44211'
        await expect(await $$('#calculation-of-runs')[0].$$('section')[1].$$('div')[4].$('span')).toHaveTextContaining('30.14684')  //Довгота: '30.14684'
        await expect(await $$('#calculation-of-runs')[0].$$('section')[1].$$('div')[5].$('span')).toHaveTextContaining('10.11')  //Відстань: '10.11 км'
        await expect(await $$('#calculation-of-runs')[0].$$('section')[1].$$('div')[6].$('span')).toHaveTextContaining('1.00 га')  //Площа ділянки: '1.00 га'
        await expect(await $$('#calculation-of-runs')[0].$$('section')[1].$$('div')[7].$('span')).toHaveTextContaining('10.11 кг')  //Загальне споживання: '10.11 кг'
        await expect(await $$('#calculation-of-runs')[0].$$('section')[1].$$('div')[8].$('span')).toHaveTextContaining('10.00 кг/га')  //Норма: '10.00 кг/га'
        await expect(await $$('#calculation-of-runs')[0].$$('section')[1].$$('div')[9].$('span')).toHaveTextContaining('5')  //Кількість заправок: '4'
        await expect(await $$('#calculation-of-runs')[0].$$('section')[1].$$('div')[10].$('span')).toHaveTextContaining('0.07 кг')  //Остання заправка: '0.07 кг'
    })

    it('кнопка "Завантажити kml"', async () => {
        const kml = await $$('[class="table table-bordered"]')[0].$$('tbody')[0].$$('tr')[0].$$('td')[2].$('a')  //вичитати останній збережений гон
        const filePath = await kml.getAttribute('href')  //вичитати посилання на скачування
        const response3 = await browser.mock('**'+filePath, {method: 'get'})  //слухати response по посиланню
        await kml.click()  //клікнути 'Завантажити kml'
        await browser.pause(1000)
        expect(response3.matches[0].statusCode).toEqual(200)  //порівняти statusCode з 200
        await browser.pause(1000)
    })

    it('кнопка "Завантажити pdf"', async () => {
        const pdf = await $$('[class="table table-bordered"]')[0].$$('tbody')[0].$$('tr')[0].$$('td')[3].$('a')  //вичитати останній збережений гон
        const filePath2 = await pdf.getAttribute('href')  //вичитати посилання на скачування
        const response4 = await browser.mock('**'+filePath2, {method: 'get'})  //слухати response по посиланню
        await pdf.click()  //клікнути 'Завантажити pdf'
        await browser.pause(1000)
        expect(response4.matches[0].statusCode).toEqual(200)  //порівняти statusCode з 200
        await browser.pause(1000)
    })

    it('кнопка "В архів"', async () => {
        const archiv = await $$('[class="table table-bordered"]')[0].$$('tbody')[0].$$('tr')[0].$$('td')[4].$('a')  //вичитати останній збережений гон
        const filePath3 = await archiv.getAttribute('href')  //вичитати посилання на скачування
        const response5 = await browser.mock('**'+filePath3, {method: 'get'})  //слухати response по посиланню
        await archiv.click()  //клікнути 'В архів'
        await browser.pause(1000)
        expect(response5.matches[0].statusCode).toEqual(200)  //порівняти statusCode з 200
        expect(response5.matches[0].body).toEqual({ ok: true })  //порівняти body з 'ok: true'        
        await browser.pause(1000)
    })

    it('розрахунок гона після “Показати” та “В архів”', async () => {
        money3 = await $$('#main-menu-right')[0].$$('li')[3].$('a').getText()  //вичитати гроші
        money33 = money3.replace(/\s/g, '')  //прибрати пробіл з числа
        assert.ok(money33 >= 30)  //перевірити рахунок на 30 коп

        await $('[class="form-mask"]').click()  //клікнути на закреслене око
        const landPlotId2 = await $$('[class="form-wrap"]')[0].$$('div')[1]  //вичитати значення
        expect(await landPlotId2.getAttribute('class')).toEqual('form-group full-width')  //поле 'Ділянка' заповнено
        await $('#w0').setValue('21')  //заповнити поле 'Ширина причепа'
        await $('#w1').setValue('22')  //заповнити поле 'Споживання матеріалів'
        await $('#w2').setValue('23')  //заповнити поле 'Об'єм бункера'
        await $('[class="btn btn-primary calculate-gons"]').click()  //клікнути 'Розрахувати'
        await browser.pause(2000)

        //const elem3 = await $('#map div div div:nth-child(2) div:nth-child(2) div div:nth-child(3) div:nth-child(3)')  //карта 'Напрямок'
        //expect(await elem3.getAttribute('aria-label')).toBeExisting()  //'Напрямок' на карті присутній

        const save = await $('[class="btn btn-primary create-gon-info"]')  //вичитати значення
        const received = await save.isEnabled()  //доступність кнопки 'Зберегти'
        expect(received).toEqual(true)  //порівняти доступність з true
    })

    it('кнопка "Архів"->"Завантажити kml"', async () => {
        await $('[class="btn-archive"]').click()  //клікнути 'Архів'
        await browser.pause(2000)
        const archiv21 = await $$('[class="table table-bordered"]')[0].$$('tbody')[0].$$('tr')[0].$$('td')[10].$('a')
        const filePath41 = await archiv21.getAttribute('href')  //вичитати посилання на скачування
        const response61 = await browser.mock('**'+filePath41, {method: 'get'})  //слухати response по посиланню
        await archiv21.click()  //клікнути 'Завантажити kml'
        await browser.pause(1000)
        expect(response61.matches[0].statusCode).toEqual(200)  //порівняти statusCode з 200
        await browser.pause(1000)
    })

    it('"Архів": кнопка "Завантажити pdf"', async () => {
        const archiv22 = await $$('[class="table table-bordered"]')[0].$$('tbody')[0].$$('tr')[0].$$('td')[11].$('a')
        const filePath42 = await archiv22.getAttribute('href')  //вичитати посилання на скачування
        const response62 = await browser.mock('**'+filePath42, {method: 'get'})  //слухати response по посиланню
        await archiv22.click()  //клікнути 'Завантажити pdf'
        await browser.pause(1000)
        expect(response62.matches[0].statusCode).toEqual(200)  //порівняти statusCode з 200
        await browser.pause(1000)
    })
    
    it('"Архів": кнопка "Відновити"->"Назад до гонів"', async () => {
        const archiv23 = await $$('[class="table table-bordered"]')[0].$$('tbody')[0].$$('tr')[0].$$('td')[12].$('a')
        const filePath43 = await archiv23.getAttribute('href')  //вичитати посилання на скачування
        const response63 = await browser.mock('**'+filePath43, {method: 'get'})  //слухати response по посиланню
        await archiv23.click()  //клікнути 'Відновити'
        await browser.pause(1000)
        expect(response63.matches[0].statusCode).toEqual(200)  //порівняти statusCode з 200
        expect(response63.matches[0].body).toEqual({ ok: true })  //порівняти body з 'ok: true'
        await browser.pause(1000)
        await $$('[class="nav nav-sidebar"]')[0].$$('li')[0].$('a').click()  //клікнути 'Назад до гонів'
        await browser.pause(2000)
        await $$('[name="landPlotId"]')[0].selectByAttribute('value', '153745')  //вибрати 'Ділянка 1 га' без відкриття комбобоксу
        await browser.pause(2000)
        await $$('[class="table table-bordered"]')[0].$$('tbody')[0].$$('tr')[0].$$('td')[1].$('a').click()  //клікнути 'Показати'
        await browser.pause(2000)
    })
    
    it('Logout', async () => {
        if ($('[class="navbar-toggle"]').click()  //клікнути кнопку контекстного меню 'Burger'
        ){
        await $$('#main-menu-right')[0].$$('li')[5].$('a').click()  //клікнути меню USER
        await browser.pause(1000)
        await $('#w5 li:nth-last-child(1) a').click()  //LOGOUT
        await browser.pause(1000)
    }})
})