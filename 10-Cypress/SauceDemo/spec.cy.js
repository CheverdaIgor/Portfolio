import { loginUser } from './loginPage.cy';

describe('SauceDemo', () => {
  beforeEach(() => {
    cy.window().then((win) => {
      cy.stub(win.console, 'error').as('consoleError');
    });
    loginUser(1);
  });
  
  it('Navigates to Landing Page', () => {
    const buttonAdd = '#add-to-cart-sauce-labs-backpack';
    const buttonCart = 'a.shopping_cart_link';
    const buttonRemove = '#remove-sauce-labs-backpack';
    const buttonCheckout = '#checkout';
    const buttonContinue = '#continue';
    const errorSelector = 'h3[data-test="error"]';

    function errorMessageShouldBe(expectedErrorMessage) {
      cy.get(errorSelector)
        .invoke('text')
        .should('eq', expectedErrorMessage);
    };
    
    cy.get(buttonAdd).click();
    cy.get(buttonCart)
    .children().should('have.length', 1)
    .click();
    cy.get(buttonRemove).click();
    cy.get(buttonCheckout).click();
    cy.get(buttonContinue).click();
    errorMessageShouldBe('Error: First Name is required');
  });
});