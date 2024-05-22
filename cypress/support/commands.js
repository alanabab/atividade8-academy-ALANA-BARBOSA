// -- This is a parent command --
// Cypress.Commands.add('login', (email, password) => { ... })
//
//
// -- This is a child command --
// Cypress.Commands.add('drag', { prevSubject: 'element'}, (subject, options) => { ... })
//
//
// -- This is a dual command --
// Cypress.Commands.add('dismiss', { prevSubject: 'optional'}, (subject, options) => { ... })
//
//
// -- This will overwrite an existing command --
// Cypress.Commands.overwrite('visit', (originalFn, url, options) => { ... })

Cypress.Commands.add('newUser', (name, email, password) => {
    cy.request(
        'POST',
        'https://raromdb-3c39614e42d4.herokuapp.com/api/users',
        {name, email, password}
    );
});

Cypress.Commands.add('login', (email, password) => {
    cy.request(
        'POST',
        'https://raromdb-3c39614e42d4.herokuapp.com/api/auth/login',
        {email, password}
    );
});

Cypress.Commands.add('promoveAdmin', (token) => {
    cy.request({
        method: 'PATCH',
        url: 'https://raromdb-3c39614e42d4.herokuapp.com/api/users/admin',
        headers: {
            Authorization: `Bearer ${token}`
        }
    })
});

Cypress.Commands.add('promoveCritico', (token) => {
    cy.request({
        method: 'PATCH',
        url: 'https://raromdb-3c39614e42d4.herokuapp.com/api/users/apply',
        headers: {
            Authorization: `Bearer ${token}`
        }
    })
});

Cypress.Commands.add('Admin', (email) => {
    cy.newUser('Admin', email, 'ABCDEF');
    cy.login(email, 'ABCDEF').then((response) => {
        cy.wrap(response.body.accessToken).as('token');
    });
    cy.get('@token').then((token) => {
        cy.promoveAdmin(token);
    })
});

Cypress.Commands.add('Critico', (email) => {
    cy.newUser('Crítico', email, 'ABCDEF');
    cy.login(email, 'ABCDEF').then((response) => {
        cy.wrap(response.body.accessToken).as('token');
    });
    cy.get('@token').then((token) => {
        cy.promoveCritico(token);
    })
});
