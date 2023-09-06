const LoginPage = require('./2-inseanq.login.page');
const AvailabilityPage = require('./4-inseanq.availability.page');

describe('Result:', () => {
    it('Login: should login with valid credentials', async () => {
        await LoginPage.open();
        await LoginPage.login();
    })
    
    it('Availability: create schedule', async () => {
        await AvailabilityPage.sectionAvailability()
        await AvailabilityPage.btnCreate()
    })
})