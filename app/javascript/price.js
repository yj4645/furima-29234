function price(){

const  TextInsert = document.getElementById("item-price");
const  TextPrice = document.getElementById("add-tax-price");
const  TextProfit = document.getElementById("profit");

TextInsert.addEventListener('keyup', function(){
  const Price = document.getElementById("item-price").value;
  const TaxPrice = Price*0.1;
  const TaxProfit = Price*0.9; 
  TextPrice.innerHTML = TaxPrice
  TextProfit.innerHTML = TaxProfit
 
    
})
}
window.addEventListener('load', price);