describe('google.com', () => {
    it('test', () => {
        // Send a GET request to google.com and assert the response status code is 200
        cy.request({
            method: 'GET',
            url: 'https://www.google.com',
        }).then((response) => {
            expect(response.status).to.eq(200);
        });

        // Visit the google.com homepage
        cy.visit('https://www.google.com/');
        cy.request('https://www.google.com/').its('status').should('eq', 200);

        // Intercept GET requests containing 'search?q=cypress+automation+certification' and alias it as 'createRequest'
        cy.intercept('GET', '**/search?q=cypress+automation+certification*').as('createRequest');

        // Type 'cypress automation' into the Search input
        cy.get('#APjFqb').type('cypress automation');
        //cy.wait(1000);

        // Iterate over the list items and click on the item containing 'cypress automation certification'
        cy.get('ul[class="G43f7e"] > li').each(($el) => {
            if ($el.text().includes('cypress automation certification')) {
                cy.wrap($el).click();
            }
        });

        // Wait for the intercepted request 'createRequest' and assert its response status code is 200
        cy.wait('@createRequest').then((interception) => {
            expect(interception.response.statusCode).to.equal(200);
        });

        // Assert that the Search input has the value 'cypress automation certification'
        cy.get('#APjFqb')
        .should('exist')
        .should('have.value', 'cypress automation certification');
    });
});