import { loginUser } from './loginPage.cy';

describe('Login and Navigation Tests', () => {
    beforeEach(() => {
      cy.window().then((win) => {
        cy.stub(win.console, 'error').as('consoleError');
      });
      loginUser("Admin", "admin123");
    });

    it('Navigates to Landing Page', () => {
        //cy.visit('https://opensource-demo.orangehrmlive.com/web/index.php/dashboard/index');
        //cy.get('a[href="/web/index.php/pim/viewMyDetails"]').click();
        cy.visit('https://opensource-demo.orangehrmlive.com/web/index.php/pim/viewPersonalDetails/empNumber/7');
        cy.wait(1000);
        
        let data = 'test';
        let date = '2000-10-10';
        let isCheckboxChecked, isRadioChecked;

        cy.get('div[class="oxd-form-row"] > div')
        .find('input').as('finputTest')
        .should('have.length', 15)
        .each(($input, index) => {

          if ($input.attr('placeholder') === 'yyyy-mm-dd') {
            cy.wrap($input)
            .clear({ force: true })
            .type(date, { force: true });
          
          } else if ($input.attr('type') === 'radio') {
            if (!$input.is(':checked')) {
              cy.wrap($input)
              .check({ force: true });
              isRadioChecked = index;
            }
          
          } else if ($input.attr('type') === 'checkbox') {
            if (!$input.is(':checked')) {
              cy.wrap($input)
              .click({ force: true });
              isCheckboxChecked = index;
            }
            else {
              cy.wrap($input)
              .click({ force: true });
            }
          
          } else {
            cy.wrap($input)
            .clear({ force: true })
            .type(data, { force: true });
            }
          });

        cy.get('.oxd-select-text-input')
        .should('have.length', 3)
        .each(($dropdown) => {
          cy.wrap($dropdown)
          .type('o', { force: true })
          .click();
        });
          
        //cy.get('[class="oxd-radio-input oxd-radio-input--active --label-right oxd-radio-input"]:first').click();
        //cy.get('[class="oxd-icon bi-check oxd-checkbox-input-icon"]:first').click();
        
        cy.get('@finputTest')
        .should('have.length', 15)
        .each(($input, index) => {
          
          if ($input.attr('placeholder') === 'yyyy-mm-dd') {
            cy.wrap($input)
            .should('have.value', date);

          } else if ($input.attr('type') === 'radio') {
              if (index === isRadioChecked) {
                cy.wrap($input)
                .should('be.checked');
              } else {
                cy.wrap($input)
                .should('not.be.checked');
              }
          
          } else if ($input.attr('type') === 'checkbox') {
              if (index === isCheckboxChecked) {
                cy.wrap($input)
                .should('be.checked');
              } else {
                cy.wrap($input)
                .should('not.be.checked');
              }
          
          } else {
            cy.wrap($input)
            .should('have.value', data);
            }
          });
      });
});