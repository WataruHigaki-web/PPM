$('input[name="delete_button"]').click(function(){
  const delIndex = $(this).closest('tr')[0].rowIndex - 1;
  console.log(delIndex);
  var q = document.createElement('input');
     q.type = 'hidden';
     q.name = "number";
     q.value = delIndex;
     document.forms[0].appendChild(q);
});

sum = document.getElementById('cart_item_sum').textContent;
final_sum = sum;
point_sum = Number("<%= (@sum / 100).floor * @point_event.bonus %>");
console.log(point_sum);
$('input[name="quantity"]').change(function() {
  var quantity = Number($(this).val());
  var price = Number($('.price').data('price'));
  var day = Number($('#day').val());
  $('#cart_item_sum').text(String(quantity * price * day));
  sum = document.getElementById('cart_item_sum').textContent;
});


$('#day').change(function(){
  var day = Number($(this).val());
  var discount = 0;
  if ($("#discount-price").length) {
    discount = Number($("#discount-price").data("price"));
    require_day = Number($("#discount-price").data("require-day"));
    require_combo = Number($("#discount-price").data("require-combo"));
    require_item = Number($("#discount-price").data("require-item"));
    combo_count = Number($(".combo_count").data("combo-count"));
    if ($(".item_count").data("item-count")){
      item_count = Number($(".item_count").data("item-count"));
    }else{
       item_count = 0
    }

    if (day >= require_day && combo_count >= require_combo && item_count >= require_item){
      $('#cart_item_sum').text(String(sum * day) - discount + '円');
      $('#point_sum').text(String(point_sum * day) - (discount / 100) + 'pt');
    }else{
      alert ('クーポンの条件に一致しておりません')
      $('#cart_item_sum').text(String(sum * day));
      $('#point_sum').text(String(point_sum * day) + 'pt');
    }
  }else{
    $('#cart_item_sum').text(String(sum * day));
    $('#point_sum').text(String(point_sum * day) + 'pt');
  }
});