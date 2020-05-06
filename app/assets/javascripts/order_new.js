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
  var d1 = new Date(document.getElementById("start_date").value);
  var d2 = new Date(document.getElementById("finish_date").value);
  get_date(d1, d2)
});

$('#finish_date').change(function() {
  var d1 = new Date(document.getElementById("start_date").value);
  var d2 = new Date(document.getElementById("finish_date").value);
  get_date(d1, d2)
});


function get_date(start_date, finish_date){
  var today = new Date(Date.now());
  var date = (finish_date - start_date)/(24*60*60*1000);
  if (Math.sign(date) == 1 && today < start_date && !$('#alert').length){
    document.getElementById("button").disabled = false;
    var q = document.createElement('input');
    q.type = 'hidden';
    q.name = "day";
    q.value = date;
    document.forms[0].appendChild(q);
  }
}
