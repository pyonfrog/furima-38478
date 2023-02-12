window.addEventListener('load', () => {
  console.log("OK");
});

const priceInput = document.getElementById("item_price");
console.log(priceInput);

priceInput.addEventListener("input", () => {
  console.log("イベント発火");
  const inputValue = priceInput.value;
   console.log(inputValue);
})

const addTaxDom = document.getElementById("販売手数料を表示する場所のid");
    addTaxDom.innerHTML = "入力した金額をもとに販売手数料を計算する処理"