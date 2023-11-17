import { loginUser } from './loginPage.cy';

describe('SauceDemo', () => {
  beforeEach(() => {
    loginUser(1);
    //1-standard_user
    //2-locked_out_user
    //3-problem_user
    //4-performance_glitch_user
    //5-error_user
    //6-visual_user
  });
  
    const buttonAdd1 = '#add-to-cart-sauce-labs-backpack';
    const buttonAdd2 = '#add-to-cart-sauce-labs-bike-light';
    const buttonRemoveAdd2 = '#remove-sauce-labs-bike-light';
    const buttonAdd3 = '#add-to-cart-sauce-labs-onesie';
    const buttonAdd4 = '#add-to-cart-sauce-labs-fleece-jacket';
    const buttonRemoveAdd4 = '#remove-sauce-labs-fleece-jacket';
    const buttonCart = 'a.shopping_cart_link';
    const sortContainer = 'select[class="product_sort_container"]';
    const buttonRemove = '#remove-sauce-labs-backpack';
    const buttonCheckout = '#checkout';
    const buttonContinue = '#continue';
    const errorSelector = 'h3[data-test="error"]';
    const firstName = '#first-name';
    const lastName = '#last-name';
    const postalCode = '#postal-code';
    const total = 'div[class="summary_info_label summary_total_label"]';
    const finish = '#finish';
    const completeHeader = 'h2.complete-header';
    const backProducts = '#back-to-products';
    const burgerMenuOpen = '#react-burger-menu-btn';
    const burgerMenuClose = '#react-burger-cross-btn';
    const allItems = '#inventory_sidebar_link';
    const logout = '#logout_sidebar_link';
    const reset = '#reset_sidebar_link';
    
    it('Navigates to Landing Page', () => {
    cy.url().should('contain', '/inventory.html');
    cy.getCookies('standard_user').should('exist');

    cy.get(burgerMenuOpen).click();
    cy.get(reset).click();
    cy.get(burgerMenuClose).click();
    
    cy.get(buttonCart).should('not.have.descendants');
    cy.get(buttonAdd1).click();
    cy.get(buttonAdd2).click();
    cy.get(buttonAdd3).click();
    cy.get(buttonAdd4).click();
    cy.get(buttonCart).children().should('have.text', 4)
    cy.get(buttonRemoveAdd4).click();
    cy.get(buttonRemoveAdd2).click();
    cy.get(buttonCart).children().should('have.text', 2)

    cy.xpath('//*[@class="inventory_list"]//div[1]/div[2]/div[1]/a/div').should('have.text', 'Sauce Labs Backpack');
    cy.get(sortContainer).select('za', { force: true });
    cy.xpath('//*[@class="inventory_list"]//div[1]/div[2]/div[1]/a/div').should('have.text', 'Test.allTheThings() T-Shirt (Red)');
    cy.get(sortContainer).select('lohi', { force: true });
    cy.xpath('//*[@class="inventory_list"]//div[1]/div[2]/div[1]/a/div').should('have.text', 'Sauce Labs Onesie');
    cy.get(sortContainer).select('hilo', { force: true });
    cy.xpath('//*[@class="inventory_list"]//div[1]/div[2]/div[1]/a/div').should('have.text', 'Sauce Labs Fleece Jacket').click();
    cy.get(buttonAdd4).click();
    cy.get(buttonCart).children().should('have.text', 3)
    cy.get(buttonRemoveAdd4).click();
    cy.get(buttonCart).children().should('have.text', 2)
    cy.get(buttonAdd4).click();
    cy.get(backProducts).click();

    cy.get(burgerMenuOpen).click();
    cy.get(logout).click();    
  });

  it('Shopping', () => {
    cy.url().should('contain', '/inventory.html');
    cy.getCookies('standard_user').should('exist');

    function errorMessageShouldBe(expectedErrorMessage) {
      cy.get(errorSelector)
        .invoke('text')
        .should('eq', expectedErrorMessage);
    };
    
    cy.get(buttonCart).children().should('have.text', 3).click();
    cy.get(buttonRemove).click();
    cy.get(burgerMenuOpen).click();
    cy.get(allItems).click();
    cy.get(buttonCart).children().should('have.text', 2).click();
    cy.get(buttonCheckout).click();
    cy.get(buttonContinue).click();
    errorMessageShouldBe('Error: First Name is required');
    cy.get(firstName).type(1);
    cy.get(buttonContinue).click();
    errorMessageShouldBe('Error: Last Name is required');
    cy.get(lastName).type(2);
    cy.get(buttonContinue).click();
    errorMessageShouldBe('Error: Postal Code is required');
    cy.get(postalCode).type(3);
    cy.get(buttonContinue).click();
    cy.get(total).should('have.text', 'Total: $62.62')
    cy.get(finish).click();
    cy.get(completeHeader).should('have.text', 'Thank you for your order!')
    cy.get(backProducts).click();

    cy.get(burgerMenuOpen).click();
    cy.get(logout).click();
  });
});