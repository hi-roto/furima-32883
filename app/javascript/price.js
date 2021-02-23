window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTax = document.getElementById("add-tax-price");
    const taxNum = Math.floor(inputValue * 0.1);
    addTax.innerHTML = taxNum;
    const addProfit = document.getElementById("profit");
    addProfit.innerHTML = inputValue - taxNum;
  })

})