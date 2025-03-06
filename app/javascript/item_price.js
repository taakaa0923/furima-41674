const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const priceInput = document.getElementById("item-price");
  //  console.log(priceInput)
    priceInput.addEventListener("input", () => {
      const addTaxDom = document.getElementById("add-tax-price");
      // console.log(priceInput.innerHTML);
      addTaxDom.innerHTML = Math.round(priceInput.value * 0.1 );
      const addProfitDom = document.getElementById("profit");
      // console.log(priceInput.innerHTML);
      addProfitDom.innerHTML = Math.round(priceInput.value - Math.round(priceInput.value * 0.1 ))
  })
})

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);