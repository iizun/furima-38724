function price (){
  const price = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  price.addEventListener("input", () => {
    const inputValue = price.value;
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
    profit.innerHTML = inputValue - Math.floor(inputValue * 0.1)
  })
};

window.addEventListener('load', price);


