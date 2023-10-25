describe('login', () => {
    it('SoftFarm', () => {
        cy.visit('https://www.soft.farm/uk/login');

        cy.get('#loginform-username').type('testqa@test.tt');
        cy.get('#loginform-password').type('qwerty12');
        cy.get('input[type="checkbox"]').click();
        cy.get('button[class="btn-login"]').click();
        
        cy.get('span[class="client__id"]', { timeout: 5000 }).should('exist');
        
        cy.window().then(win => {
            cy.stub(win, 'onerror').as('windowOnError');
        });
        cy.get('@windowOnError').should('not.be.called');
        
        cy.url().should('eq', 'https://www.soft.farm/uk/crop/field-map');
        cy.get('button[class="navbar-toggle"]').should('exist');
        cy.get('button[class="navbar-toggle"]').click();
        cy.wait(1000);
        cy.get('li[class="dropdown"]').eq(1).click();
        cy.get('a[href="/uk/logout"]').click();
        cy.url().should('contain', '/uk')
    });
});
