describe('error_user', () => {    
    context('Item', function () {
        const submitSelector = 'input[type="submit"]';
        const errorSelector = 'h3[data-test="error"]';
        
        const addToCart = 'div[class="pricebar"] > button'        
        const buttonAdd1 = '#add-to-cart-sauce-labs-backpack';
        const buttonRemove1 = '#remove-sauce-labs-backpack';
        const buttonAdd2 = '#add-to-cart-sauce-labs-bike-light';
        const buttonRemove2 = '#remove-sauce-labs-bike-light';
        const buttonAdd3 = '#add-to-cart-sauce-labs-onesie';
        const buttonAdd4 = '#add-to-cart-sauce-labs-fleece-jacket';
        const buttonRemove4 = '#remove-sauce-labs-fleece-jacket';

        const buttonCart = 'a.shopping_cart_link';
        const buttonCheckout = '#checkout';
        
        const firstName = '#first-name';
        const lastName = '#last-name';
        const postalCode = '#postal-code';
        const buttonContinue = '#continue';

        const total = 'div[class="summary_info_label summary_total_label"]';
        const finish = '#finish';

        const completeHeader = 'h2.complete-header';
        const backProducts = '#back-to-products';
        const sortContainer = 'select[class="product_sort_container"]';

        const burgerMenuOpen = '#react-burger-menu-btn';
        const burgerMenuClose = '#react-burger-cross-btn';
        const allItems = '#inventory_sidebar_link';
        const logout = '#logout_sidebar_link';
        const reset = '#reset_sidebar_link';
        
    it('Error_1', () => {
        cy.visit('https://www.saucedemo.com/');
        
        const user = cy.xpath('//*[@id="login_credentials"]/text()[5]');
        //1-standard_user
        //2-locked_out_user
        //3-problem_user
        //4-performance_glitch_user
        //5-error_user
        //6-visual_user
        const pas = cy.xpath('//*[@class="login_password"]/text()');
        const username = cy.get('input[placeholder="Username"]');
        const password = cy.get('input[placeholder="Password"]');

        function enterTextAndType(element, target) {
            element.then(($el) => {
              const text = $el.text();
              target.type(text);
            });
        };
        
        enterTextAndType(user, username);
        enterTextAndType(pas, password);
        cy.get(submitSelector).click();

        cy.get(addToCart).then(($button) => {
            if ($button.attr('id') === 'add-to-cart-sauce-labs-backpack') {
                cy.get(buttonAdd1).click();
                cy.get(buttonRemove1).click();
                cy.get(buttonAdd1).click();
            } else {
                cy.get(buttonRemove1).click();
                cy.get(buttonAdd1).click();
            }
        });
    });
    
    it('Error_2', () => {
        function errorMessageShouldBe(expectedErrorMessage) {
            cy.get(errorSelector)
              .invoke('text')
              .should('eq', expectedErrorMessage);
        };
        
        cy.get(buttonCart).click();
        cy.get(buttonCheckout).click();
        cy.get(lastName)
        .type(lastName)
        .should('have.value', lastName);
        cy.get(buttonContinue).click();
        errorMessageShouldBe('Error: First Name is required');
    });
  });
});