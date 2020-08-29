window.addEventListener('load', function(){
 
  const price = document.getElementById("item-price")
  
  price.addEventListener('input', function(){

    const tax = price.value * 0.10
    const benefit = price.value - tax
    
    const addTaxPrice = document.getElementById("add-tax-price")
    addTaxPrice.innerHTML = ('addTaxPrice', tax )

    const profit = document.getElementById('profit')
    profit.innerHTML = ( 'profit', benefit )

  })    
})

// keyが入力されたらaddEventListener
  // まずは、画面にある数字をJSで取得しましょう。→手数料を計算する。→画面に挿入する。
  // まずは挿入する場所の要素を取得する。変数へいれる。innerHTML textContent