class LoginPage {
    loginUser(username, password) {
        cy.session([username, password], () => {
            cy.visit('https://www.soft.farm/uk/login');
            cy.get('#loginform-username').type(username);
            cy.get('#loginform-password').type(password);
            cy.get('input[type="checkbox"]').click();
            cy.get('.btn-login').click();
            cy.wait(5000);

            cy.url().should('contain', '/uk/crop/field-map');
            cy.location('pathname').should('eq', '/uk/crop/field-map');

            cy.getCookies('SoftFarmIdentity').should('exist');
            cy.document()
            .its('cookie')
            .should('exist');
        },
        {
        validate() {
            cy.request('https://www.soft.farm/uk/crop/field-map').its('status').should('eq', 200);
        }
    })
}}

export default new LoginPage();