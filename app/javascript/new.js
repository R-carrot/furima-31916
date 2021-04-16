window.addEventListener('load', function(){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", function(){
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    if ( 300 <= inputValue && inputValue <= 9999999 ) {
      addTaxDom.innerHTML = Math.floor( inputValue / 10);
      const value = inputValue / 10;
      profit.innerHTML = Math.floor( inputValue - value );
      console.log(addTaxDom);
      console.log(profit);
    } else {
      addTaxDom.innerHTML = "";
      profit.innerHTML = "";
      console.log(addTaxDom);
      console.log(profit);
    }
    // $(function (){
    //   $("#item-price").on("input", function(){
    //     let price = $("#item-price").val();
    //     if( 300 <= price && price <= 9999999) {
    //       let fee = Math.floor( price / 10 );
    //       let profit = (price - fee);
    //       $("#add-tax-price").text(fee);
    //       $("#profit").text(profit);
    //     }else{
    //       $("#add-tax-price").text('');
    //       $("#profit").text('');
    //     }
    //   })
    // });
  });
});