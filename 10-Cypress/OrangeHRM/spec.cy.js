import { loginUser } from './loginPage.cy';

describe('Login and Navigation Tests', () => {
    beforeEach(() => {
        loginUser("Admin", "admin123");
        cy.window().then((win) => {
            cy.stub(win.console, 'error').as('consoleError');
        });
    });

    it('Navigates to Landing Page', () => {
        cy.visit('https://opensource-demo.orangehrmlive.com/web/index.php/dashboard/index');
        cy.get('a[href="/web/index.php/pim/viewMyDetails"]').click();        
        //cy.wait(1000);

        //cy.get('input.oxd-input.oxd-input--active')
        cy.get('div[class="oxd-form-row"] > div')
        .find('input')
        .each(($input) => {
          if ($input.attr('placeholder') === 'yyyy-mm-dd') {
            cy.wrap($input).clear({ force: true }).type('2000-10-10', { force: true });
          } else if ($input.attr('type') === 'radio' || $input.attr('type') === 'checkbox') {
            cy.wrap($input).check({ force: true });
          } else {
            cy.wrap($input).clear({ force: true }).type('test', { force: true });
          }
        });
    });
});