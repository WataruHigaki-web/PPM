$('.order_new_radio').find(".form_class").hide();
$('input[name="return_status"]').change(function(){
  if($(this).val() == "2"){
    $(this).parent().find(".form_class").show();
  }else{
    $(this).parent().find(".form_class").hide();
  }
});

if($('#alert').length){
  alert ('クレジットカード登録してください。')
}
$('#start_date').change(function() {
  d1 = new Date(document.getElementById("start_date").value);
  d2 = new Date(document.getElementById("finish_date").value);
  get_date(d1, d2)
});

$('#finish_date').change(function() {
  d1 = new Date(document.getElementById("start_date").value);
  d2 = new Date(document.getElementById("finish_date").value);
  get_date(d1, d2)
});

var today = new Date(Date.now());

function get_date(start_date, finish_date){
  if (start_date && finish_date){
    var date = (finish_date - start_date)/(24*60*60*1000);
    if (Math.sign(date) == -1　||　today > d1 || date == 0 || $('#alert').length){
      document.getElementById("button").disabled = true;
    }else{
      document.getElementById("button").disabled = false;
      var q = document.createElement('input');
      q.type = 'hidden';
      q.name = "day";
      q.value = date;
      document.forms[0].appendChild(q);
    }
  }else{
    document.getElementById("button").disabled = true;
    alert ('利用期間の入力に誤りがあります');
  }
}
