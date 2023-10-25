describe('Todo App with React Hooks', () => {
  // Test to check if the form elements are present
  it('should have a form', () => {
    // Visiting the app's URL
    cy.visit('http://localhost:3000');

    // Checking if input fields are empty and the button text is 'Save'
    cy.get('input').should('have.value', ''); // Checking input field
    cy.xpath('//*[@type="text"]').should('have.value', ''); // Using XPath to check input field
    cy.get('button').should('have.text', 'Save'); // Checking button text
  });

  // Test to add tasks, delete a task, and toggle its status
  it('should add a task / delete task / toggle status', () => {
    // Visiting the app's URL
    cy.visit('http://localhost:3000');

    // Adding a task 'Learn React' and checking if it appears in the todo list
    cy.get('input[type="text"]').type('Learn React').should('have.value', 'Learn React');
    cy.contains('Save').click();
    cy.get('div[class="item-todo"] div:first-of-type').should('have.text', 'Learn React');
    cy.get('input[type="text"]').should('have.value', ''); // Checking if input field is empty after adding task

    // Adding another task 'Learn Redux' and checking if it appears in the todo list
    cy.get('input[type="text"]').type('Learn Redux').should('have.value', 'Learn Redux');
    cy.contains('Save').click();
    cy.get('div[class="item-todo"]:last-child div:first-of-type').should('have.text', 'Learn Redux');
    cy.get('input[type="text"]').should('have.value', ''); // Checking if input field is empty after adding task

    // Checking if there are 2 tasks in the todo list
    cy.get('div[class="item-todo"]').should('have.length', 2);

    // Deleting a task and checking if only one task is left in the todo list
    cy.get('div[class="item-todo"]:last-child div:last-of-type').click();
    cy.get('div[class="item-todo"]').should('have.length', 1);

    // Toggling the status of the remaining task and checking if it has the correct class
    cy.get('div.item-todo div:first-of-type').should('have.class', 'item-text').click();
    cy.get('div.item-todo div:first-of-type').should('have.class', 'item-text strike');
  });
});