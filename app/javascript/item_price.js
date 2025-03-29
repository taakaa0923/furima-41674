const setupPriceCalculation = () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const addProfitDom = document.getElementById("profit");

  if (priceInput && addTaxDom && addProfitDom) {
    priceInput.addEventListener("input", () => {
      const priceValue = parseFloat(priceInput.value);

      if (!isNaN(priceValue) && priceValue !== "") {
        const tax = Math.floor(priceValue * 0.1);
        const profit = Math.floor(priceValue - tax);
        addTaxDom.innerHTML = tax;
        addProfitDom.innerHTML = profit;
      } else {
        addTaxDom.innerHTML = 0;
        addProfitDom.innerHTML = 0;
      }
    });
  }
};

// ページ読み込み時と再描画時に価格計算を設定
document.addEventListener("turbo:load", setupPriceCalculation);
document.addEventListener("turbo:render", setupPriceCalculation);