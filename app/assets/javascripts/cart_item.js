$('input[name="delete_button"]').click(function(){
  const delIndex = $(this).closest('tr')[0].rowIndex - 1;
  console.log(delIndex);
  var q = document.createElement('input');
     q.type = 'hidden';
     q.name = "number";
     q.value = delIndex;
     document.forms[0].appendChild(q);
});

var sum = $('#cart_item_sum').data('sum');
var finalSum = sum;
var pointSum = Number($("#point_sum").data('point'));

$('input[name="quantity"]').change(function() {
  var quantity = Number($(this).val());
  var price = Number($('.price').data('price'));
  var day = Number($('#day').val());
  $('#cart_item_sum').text(String(quantity * price * day));
  var sum = $('#cart_item_sum').data('sum');
});
$('#day').change(function(){
  var day = Number($(this).val());
  if(Math.sign(day) == -1 || Math.sign(day) == 0 ){
    alert ('日数が不正な値です')
    return
  }
  var discount = 0;
  if ($("#discount-price").length) {
    var discount = Number($("#discount-price").data("price"));
    var requireDay = Number($("#discount-price").data("require-day"));
    var requireCombo = Number($("#discount-price").data("require-combo"));
    var requireItem = Number($("#discount-price").data("require-item"));
    var comboCount = Number($(".combo_count").data("combo-count"));
    if ($(".item_count").data("item-count") == null){
      itemCount = 0
    }else{
      itemCount = Number($(".item_count").data("item-count"));
    }

    if (day >= requireDay && comboCount >= requireCombo && itemCount >= requireItem){
      $('#cart_item_sum').text(String(sum * day) - discount + '円');
      $('#point_sum').text(String(pointSum * day) - (discount / 100) + 'pt');
    }else{
      alert ('クーポンの条件に一致しておりません')
      $('#cart_item_sum').text(String(sum * day));
      $('#point_sum').text(String(pointSum * day) + 'pt');
    }
  }else{
    $('#cart_item_sum').text(String(sum * day));
    $('#point_sum').text(String(pointSum * day) + 'pt');
  }
});

if ($("#discount-price").length) {
    var day = Number($('#day').val());
    var discount = Number($("#discount-price").data("price"));
    var requireDay = Number($("#discount-price").data("require-day"));
    var requireCombo = Number($("#discount-price").data("require-combo"));
    var requireItem = Number($("#discount-price").data("require-item"));
    var comboCount = Number($(".combo_count").data("combo-count"));
    if ($(".item_count").data("item-count") == null){
      item_count = 0
    }else{
       item_count = Number($(".item_count").data("item-count"));
    }

    if (day >= requireDay && comboCount >= requireCombo && item_count >= requireItem){
      $('#cart_item_sum').text(String(sum * day) - discount + '円');
      $('#point_sum').text(String(pointSum * day) - (discount / 100) + 'pt');
    }else{
      alert ('クーポンの条件に一致しておりません')
      $('#cart_item_sum').text(String(sum * day));
      $('#point_sum').text(String(pointSum * day) + 'pt');
    }
  }else{
    var day = Number($('#day').val());
    $('#cart_item_sum').text(String(sum * day));
    $('#point_sum').text(String(pointSum * day) + 'pt');
  }