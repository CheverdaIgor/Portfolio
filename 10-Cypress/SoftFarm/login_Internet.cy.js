describe('login', () => {
    it('Internet', () => {
        cy.visit('https://the-internet.herokuapp.com/login');

        cy.get('#username').type('tomsmith');
        cy.get('#password').type('SuperSecretPassword!');
        cy.get('button[type="submit"]').click();
    });
});
