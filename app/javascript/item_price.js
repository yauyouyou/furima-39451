const priceInput = document.getElementById("item-price");
const addTaxDom = document.getElementById("add-tax-price");

priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value.trim();
  console.log(inputValue);

  if (inputValue === "") {
    addTaxDom.innerHTML = "";
    return;
  }

  const price = parseInt(inputValue);
  if (isNaN(price)) {
    addTaxDom.innerHTML = "";
    return;
  }

  const tax = Math.floor(price * 0.1);
  addTaxDom.innerHTML = tax.toLocaleString();
});