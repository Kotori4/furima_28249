window.addEventListener('load', function(){

  document.getElementById('item-price').addEventListener('input', function(){
    if (document.getElementById("add-tax-price").textContent != ""){
      document.getElementById("add-tax-price").textContent = null
      document.getElementById("profit").textContent = null
    }
    var itemPrice = document.getElementById('item-price').value;
    var serviceCharge = document.getElementById('add-tax-price')
    var profit = document.getElementById('profit')
    
    
    itemPrice = Number(itemPrice);
    var charge = Math.floor(itemPrice * 0.1).toLocaleString();
    var userProfit = Math.floor(itemPrice * 0.9).toLocaleString();
    console.log(serviceCharge.append(charge));
    console.log(profit.append(userProfit));
  })
})

