window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      const addTaxDom = document.getElementById("add-tax-price");
        const tax = addTaxDom.innerHTML = Math.round(inputValue * 0.1);
      const addProfitDom = document.getElementById("profit");
        addProfitDom.innerHTML = Math.round(inputValue - tax)
})
});
