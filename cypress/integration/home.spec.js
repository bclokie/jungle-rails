describe('Home Page', () => {
  beforeEach(() => {
    cy.visit("/");
  });
  it("Shows products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  it("Shows 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
});