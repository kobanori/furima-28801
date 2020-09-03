function priceDetail(){
  let input = document.getElementById("item-price")
  let price = input.value
  let feeInput = Math.round(price / 10)
  let profitInput = price - feeInput

  let fee = document.getElementById("add-tax-price")
  let profit = document.getElementById("profit")  
  fee.innerHTML = feeInput
  profit.innerHTML = profitInput
}

window.addEventListener('keyup', priceDetail)
