class LoginPage {
    loginUser(username, password) {
        cy.session([username, password], () => {
            cy.visit('https://opensource-demo.orangehrmlive.com/');
            
            cy.get('div[class="oxd-sheet oxd-sheet--rounded oxd-sheet--gutters oxd-sheet--gray-lighten-2 orangehrm-demo-credentials"]')
            .contains('Username :').invoke('text').then((text) => {
                username = text.trim().replace('Username : ', '');
            cy.get('div[class="oxd-sheet oxd-sheet--rounded oxd-sheet--gutters oxd-sheet--gray-lighten-2 orangehrm-demo-credentials"]')
            .contains('Password :').invoke('text').then((text) => {
                password = text.trim().replace('Password : ', '');
            
            cy.log(username);
            cy.get('input[name="username"]').type(username);
            cy.log(password);
            cy.get('input[name="password"]').type(password);
            cy.get('button[class="oxd-button oxd-button--medium oxd-button--main orangehrm-login-button"]').click();
            //cy.wait(1000);

            cy.url().should('contain', '/web/index.php/dashboard/index');
            cy.location('pathname').should('eq', '/web/index.php/dashboard/index');

            cy.getCookies('orangehrm').should('exist');
            cy.document()
            .its('cookie')
            .should('exist');
        },
        {
        validate() {
            cy.request('https://opensource-demo.orangehrmlive.com/web/index.php/dashboard/index')
            .its('status')
            .should('eq', 200);
            }});
        });
    });
}}

export default new LoginPage();