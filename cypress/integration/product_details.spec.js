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
  it("Gets the product page when a product is clicked.", () => {
    cy.get("[alt='Giant Tea']").click();
    cy.get(".product-detail").should("be.visible");
  });
});