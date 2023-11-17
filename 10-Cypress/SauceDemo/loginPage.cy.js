class LoginPage {
    loginUser(name) {
        cy.session([name], () => {
            cy.visit('https://www.saucedemo.com/');

            const user = cy.xpath(`//*[@id="login_credentials"]/text()[${name}]`);
            const pas = cy.xpath('//*[@class="login_password"]/text()');
            const username = cy.get('input[placeholder="Username"]');
            const password = cy.get('input[placeholder="Password"]');
            const submitSelector = 'input[type="submit"]';
            const errorSelector = 'h3[data-test="error"]';
            
            function errorMessageShouldBe(expectedErrorMessage) {
              cy.get(errorSelector)
                .invoke('text')
                .should('eq', expectedErrorMessage);
            };
            
            function enterTextAndType(element, target) {
              element.then(($el) => {
                const text = $el.text();
                target.type(text);
              });
            };
            
            // Empty user and password
            cy.get(submitSelector).click();
            errorMessageShouldBe('Epic sadface: Username is required');
            
            // Password is empty
            enterTextAndType(user, username);
            cy.get(submitSelector).click();
            errorMessageShouldBe('Epic sadface: Password is required');
            
            // User is empty
            username.clear();
            enterTextAndType(pas, password);
            cy.get(submitSelector).click();
            errorMessageShouldBe('Epic sadface: Username is required');
            
            // User and password are not empty
            enterTextAndType(user, username);
            cy.get(submitSelector).click();
            cy.wait(1000);
        },
        {
        validate() {
            cy.url().should('contain', '/inventory.html');
            cy.getCookies('standard_user').should('exist');
        }}
    )}
};

export default new LoginPage();