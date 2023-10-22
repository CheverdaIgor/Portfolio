describe('Start', () => {
  it('passes if no console error occurs, fails if there is a console error', () => {
    cy.visit('https://www.selenium.dev/selenium/web/bidi/logEntryAdded.html');

    cy.window().then((win) => {
      cy.stub(win.console, 'error').as('consoleError');
    });

    cy.get('#consoleLog').click();
    cy.get('#consoleError').click();
    //cy.get('#jsException').click();

    cy.get('@consoleError').then(consoleError => {
      expect(consoleError).to.have.callCount(0);
    });
  });
});