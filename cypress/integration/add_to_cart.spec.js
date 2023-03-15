describe('Home Page', () => {
  beforeEach(() => {
    cy.visit("/");
  });
  it("Shows products on the page.", () => {
    cy.get(".products article").should("be.visible");
  });
  it("Shows 2 products on the page.", () => {
    cy.get(".products article").should("have.length", 2);
  });
  it("Adds an item to the cart and increases the cart by 1", () => {
    cy.get('.btn').first().click({ force: true });
    cy.contains("My Cart (1)");
  });
});