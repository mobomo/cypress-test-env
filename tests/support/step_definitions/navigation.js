import { When, Then } from "@badeball/cypress-cucumber-preprocessor";

When("I visit {string}", (url) => {
    cy.visit(url);
});
