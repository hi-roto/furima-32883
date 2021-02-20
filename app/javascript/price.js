window.addEventListener('load', () => {
  // 読み込まれたら以下を実行する
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    // 金額入力欄に金額を入力したら、以下を実行する
    const inputValue = priceInput.value;
    const addTax = document.getElementById("add-tax-price");
    const taxNum = Math.floor(inputValue * 0.1);
    addTax.innerHTML = taxNum;
    const addProfit = document.getElementById("profit");
    addProfit.innerHTML = inputValue - taxNum;
  })

})