document.addEventListener("turbo:load", () => {
  const priceInput = document.getElementById("item-price");

  if (priceInput) {
    priceInput.addEventListener("input", () => {
      const addTaxDom = document.getElementById("add-tax-price");
      const addProfitDom = document.getElementById("profit");

      const priceValue = priceInput.value;

      if (!isNaN(priceValue) && priceValue !== "") {
        const tax = Math.round(priceValue * 0.1);
        const profit = Math.round(priceValue - tax);

        addTaxDom.innerHTML = tax;
        addProfitDom.innerHTML = profit;
      } else {
        addTaxDom.innerHTML = 0;
        addProfitDom.innerHTML = 0;
      }
    });
  }
});