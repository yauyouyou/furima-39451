document.addEventListener("turbo:load", () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById('profit');

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value.trim();
    

    if (inputValue === "") {
      addTaxDom.innerHTML = "";
      profitDom.innerHTML = "";
      return;
    }

    const price = parseInt(inputValue);
    if (isNaN(price)) {
      addTaxDom.innerHTML = "";
      profitDom.innerHTML = "";
      return;
    }

    const tax = Math.floor(price * 0.1);
    const profit = price - tax;

    addTaxDom.innerHTML = tax.toLocaleString();
    profitDom.innerHTML = profit.toLocaleString();
  });
});