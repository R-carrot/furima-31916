window.addEventListener('load', function(){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", function(){
    const inputValue = priceInput.value;
    console.log(inputValue);
    // const addTextDom = document.getElementById("add-tax-price")
    $(function (){
      $("#item-price").on("input", function(){
        let price = $("#item-price").val();
        if( 300 <= price && price <= 9999999) {
          let fee = Math.floor( price / 10 );
          let profit = (price - fee);
          $("#add-tax-price").text(fee);
          $("#profit").text(profit);
        }else{
          $("#add-tax-price").text('');
          $("#profit").text('');
        }
      })
    });
    // addTaxDom.innerHTML = Math.floor()
  });
});