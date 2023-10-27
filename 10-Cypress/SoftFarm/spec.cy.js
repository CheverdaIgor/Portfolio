import { loginUser } from './loginPage.cy';

describe('Login and Navigation Tests', () => {
    beforeEach(() => {
        // Log in using specified credentials before each test
        loginUser('testqa@test.tt', 'qwerty12');
        // Stub console.error to handle any errors during tests
        cy.window().then((win) => {
            cy.stub(win.console, 'error').as('consoleError');
        });
    });

    xit('Navigates to Landing Page', () => {
        // Visit the landing page after logging in
        cy.visit('https://www.soft.farm/uk/crop/field-map');
        // Check if client ID element exists and log its text
        cy.get('span[class="client__id"]').should('exist').invoke('text').then((text) => {
            cy.log(`Client ID: ${text}`);
        });
        // Open the navigation menu, navigate to the calculation page
        cy.get('button[class="navbar-toggle"]').click();
        cy.get('a[class="dropdown-toggle"]').eq(2).click();
        cy.get('a[href="/uk/crop/track-calculation"]').click();
    });

    it('Performs Calculation of Runs', () => {
        // Visit the calculation page, fill out the form, and submit
        cy.visit('https://www.soft.farm/uk/crop/track-calculation');
        
        cy.get('span[class="select2-selection__arrow"]').click();
        cy.get('input[class="select2-search__field"]').type('Поле/Ділянка 1 га (не чіпати!)');
        cy.get('[class="select2-results__option select2-results__option--highlighted"]').click();
        cy.wait(1000);
        
        cy.get('select[name="landPlotId"]').select('153746', { force: true });
        cy.wait(1000);
        
        cy.get('span[class="select2-selection__arrow"]').click();
        cy.get('input[class="select2-search__field"]').type('Поле/Ділянка').then(() => {
            cy.get('ul[class="select2-results__options"] > li').each(($el) => {
              const text = $el.text();
              cy.log(text);
              if (text.includes('Поле/Ділянка 1 га (не чіпати!)')) {
                cy.wrap($el).click();
              }
            });
        });
        
        //cy.reload();
        cy.get('#w0').type('1');
        cy.get('#w1').type('10');
        cy.get('#w2').type('2.51');
        cy.get('select[class="form-control"]').select('2', { force: true });
        cy.get('button[class="btn btn-primary calculate-gons"]').click();
        
        // Intercept and check the status code of the create request
        // cy.intercept('POST', '**/create').as('createRequest');
        // cy.get('[class="btn btn-primary create-gon-info"]').click();
        // cy.wait('@createRequest').then((interception) => {
        //     // Check the response status code (should be 302)
        //     expect(interception.response.statusCode).to.equal(302);
        // });
    });

    xit('Accesses ConsoleError Page', () => {
        // Visit a specific page for error handling testing
        cy.visit('https://www.soft.farm/uk/crop/dashboard/field-map?integrationServiceId=meteo');
    });
    
    xit('Visits Relevant Links on the Page without Redundant Navigation', () => {
        const visitedUrls = {}; // Object to store visited URLs
        // Iterate over all links on the page
        cy.get('a').each(($link) => {
            const href = $link.attr('href');    
            // Exclude specific URLs from navigation
            if (href
                && href.startsWith('/uk')
                && !href.includes('/uk/crop/dashboard/field-map')
                && !href.includes('/uk/account/password')
                && !href.includes('/uk/account/protection-personal-information')
                && !href.includes('/uk/account/delete')
                && !href.includes('/uk/machine/gps-restriction')
                && !href.includes('/uk/logout')
                && !href.includes('/uk/animal/dashboard')
                ) {
                // Check if the URL has not been visited yet
                if (!visitedUrls[href]) {
                    // Mark the URL as visited
                    visitedUrls[href] = true;    
                    // Visit the link
                    cy.visit(`https://www.soft.farm${href}`);
                }
            }
        });
    });
    
    xit('Logs out the User', () => {
        // Open the navigation menu, navigate to logout, and verify the URL
        cy.get('button[class="navbar-toggle"]').click();
        cy.wait(1000);
        cy.get('li[class="dropdown"]').eq(1).click();
        cy.get('a[href="/uk/logout"]').click();
        cy.url().should('contain', '/uk');
    });
});