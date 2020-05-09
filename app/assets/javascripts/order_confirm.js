
if($('.get_status').data('presence') == "選択してください"){
  alert ('受取場所未入力です。購入情報画面からやり直しが必要です。')
}

if($('.return_status').data('zip_code') == []){
  alert ('返却場所の郵便番号が未記入です。購入情報画面からやり直しが必要です。')
}else if($('.return_status').data('address') == [] ){
  alert ('返却場所の住所が未記入です。購入情報画面からやり直しが必要です。')
}

var day = Number($('#day').data('session-day'));
if(day == 0 ){
  alert ('レンタル期間の値が不正です。購入情報画面からやり直しが必要です。')
}



var sum = Number($('#sum').data('sum'));
var create_point = Number($('#create_point').data('create-point'));
var day = Number($('#day').data('session-day'));
var discount = 0;
var point = 0;
var final_sum = sum;
if ($("#discount-price").length) {
  discount = Number($("#discount-price").data("price"));
  require_day = Number($("#discount-price").data("require-day"));
  require_combo = Number($("#discount-price").data("require-combo"));
  require_item = Number($("#discount-price").data("require-item"));
  combo_count = Number($(".combo_count").data("combo-count"));
  if ($(".item_count").data("item-count") == null){
    item_count = 0
  }else{
    item_count = Number($(".item_count").data("item-count"));
  }

    if (day >= require_day && combo_count >= require_combo && item_count >= require_item){
      final_sum = sum - discount - point;
      var bonus = Number($('#bonus').data('point-bonus'));
      $('#sum').text(String(final_sum) + '円');
      $('#create_point').text(String(create_point) - (discount * bonus / 100) + 'pt');
    }else{
      alert ('クーポン条件にマッチしておりません。')
      $('#sum').text(String(final_sum) + '円');
    }
}

$('#out_point').change(function(){
  if ($('#not_point').prop('checked')){
    var point = Number($('#not_point').val());
    var final_sum = sum;
  }else if ($('#all_point').prop('checked')){
    if(Number($('#all_point').val()) - sum - discount >= 0){
       point = sum - discount;
    }else if(Number($('#all_point').val()) - sum < 0){
      var point = Number($('#all_point').val());
    }
    document.getElementById("out").value = point;
  }else{
    point = Number($('#part_point').val());
    var all_point = Number($('#all_point').val());
    var final_sum = sum;
    if (point > all_point || point > final_sum){
      document.getElementById("button").disabled = true;
      alert ('利用ポイントが不正な値です')
    }else{
      document.getElementById("button").disabled = false;
      document.getElementById("out").value = point;
    }
  }
   final_sum = sum - discount - point;
   $('#sum').text(String(final_sum) + '円');
   if(final_sum < 0){
    alert ('利用ポイントが不正な値です')
   }
   var bonus = Number($('#bonus').data('point-bonus'));
   $('#sum').text(String(final_sum) + '円');
   $('#create_point').text(String(final_sum * bonus / 100) + 'pt');
   var create_point = final_sum * bonus / 100;
   document.getElementById("create").value = create_point;
});