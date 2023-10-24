describe('Todo - React', () => {
  let TODO_ITEM_ONE = 'Igor_1';
  let TODO_ITEM_TWO = 'Igor_2';
  let TODO_ITEM_THREE = 'Igor_3';
  let todos = [TODO_ITEM_ONE, TODO_ITEM_TWO, TODO_ITEM_THREE];

  // Before each test, visit the application at http://localhost:3000
  beforeEach(function () {
    cy.visit('/');
  });

  // Test to add 2 todos
  it('should add 2 todos', function () {
    // Type and add two todos
    cy.get('input[type="text"]')
      .type('test_1{enter}')
      .type('test_2{enter}');

    // Check if there are 2 todo items
    cy.get('div[class="item-todo"]').should('have.length', 2);
  });

  // Test to create and manipulate todos
  context('Item', function () {
    // Test to create 2 todos
    it('should create 2 todos', function () {
      // Create two todos and alias them for later use
      cy.createTodo(TODO_ITEM_ONE).as('firstTodo');
      cy.createTodo(TODO_ITEM_TWO).as('secondTodo');

      // Check if there are 2 todo items
      cy.get('div[class="item-todo"]').should('have.length', 2);
    });

    // Test to create default todos, modify them, and check their contents
    it('should create default todos, modify them, and check their contents', function () {
      // Create default todos and alias them for later use
      cy.createDefaultTodos(todos).as('todos');

      // Click on the first todo's text and then delete it
      cy.get('@todos')
        .eq(0)
        .as('firstTodo')
        .find('.item-text')
        .click();
      cy.get('@firstTodo')
        .find('.item-delete')
        .click();

      // Check the contents of the second todo
      cy.get('@todos')
        .eq(1)
        .find('.item-text')
        .should('contain', TODO_ITEM_THREE)
        .click();
    });
  });
});