
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
var createPoint = Number($('#create_point').data('create-point'));
var day = Number($('#day').data('session-day'));
var discount = 0;
var point = 0;
var finalSum = sum;
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
      var finalSum = sum - discount - point;
      var bonus = Number($('#bonus').data('point-bonus'));
      $('#sum').text(String(finalSum) + '円');
      $('#create_point').text(String(create_point) - (discount * bonus / 100) + 'pt');
    }else{
      alert ('クーポン条件にマッチしておりません。')
      $('#sum').text(String(finalSum) + '円');
    }
}

$('#out_point').change(function(){
  if ($('#not_point').prop('checked')){
    var point = Number($('#not_point').val());
    var finalSum = sum;
  }else if ($('#all_point').prop('checked')){
    if(Number($('#all_point').val()) - sum - discount >= 0){
      var point = sum - discount;
    }else if(Number($('#all_point').val()) - sum < 0){
      var point = Number($('#all_point').val());
    }
    document.getElementById("out").value = point;
  }else{
    var point = Number($('#part_point').val());
    var allPoint = Number($('#all_point').val());
    var finalSum = sum;
    if (point > allPoint || point > finalSum){
      document.getElementById("button").disabled = true;
      alert ('利用ポイントが不正な値です')
    }else{
      document.getElementById("button").disabled = false;
      document.getElementById("out").value = point;
    }
  }
   finalSum = sum - discount - point;
   $('#sum').text(String(finalSum) + '円');
   if(finalSum < 0){
    alert ('利用ポイントが不正な値です')
   }
   var bonus = Number($('#bonus').data('point-bonus'));
   $('#sum').text(String(finalSum) + '円');
   $('#create_point').text(String(finalSum * bonus / 100) + 'pt');
   var createPoint = finalSum * bonus / 100;
   document.getElementById("create").value = createPoint;
});