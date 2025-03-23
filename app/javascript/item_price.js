document.addEventListener("turbo:load", () => {
  const priceInput = document.getElementById("item-price");

  function updatePrice() {
    const addTaxDom = document.getElementById("add-tax-price");
    const addProfitDom = document.getElementById("profit");

    if (priceInput) {
      const priceValue = priceInput.value;

      if (!isNaN(priceValue) && priceValue !== "") {
        const tax = Math.floor(priceValue * 0.1);
        const profit = Math.floor(priceValue - tax);

        addTaxDom.innerHTML = tax;
        addProfitDom.innerHTML = profit;
      } else {
        addTaxDom.innerHTML = 0;
        addProfitDom.innerHTML = 0;
      }
    }
  }

  if (priceInput) {
    priceInput.addEventListener("input", updatePrice);
  }

  window.addEventListener("turbo:load", updatePrice);
  window.addEventListener("turbo:render", updatePrice);
});