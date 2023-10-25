import { loginUser } from './loginPage.cy';

describe('log in once', () => {
    beforeEach(() => {
        loginUser('testqa@test.tt', 'qwerty12');
    });

    it('is logged in (1st test)', () => {
        cy.get('span[class="client__id"]').should('exist');
    });

    it('stays logged in (2nd test)', () => {
        cy.get('button[class="navbar-toggle"]').click();
        cy.wait(1000);
        cy.get('li[class="dropdown"]').eq(1).click();
        cy.get('a[href="/uk/logout"]').click();
        cy.url().should('contain', '/uk')
    });
});