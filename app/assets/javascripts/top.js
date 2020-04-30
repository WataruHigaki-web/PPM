$('input[name="order[return_status]"]').parent().find(".form_class").hide();
$('input[name="order[return_status]"]').change(function(){
  if($(this).val() == "2"){
      $(this).parent().find(".form_class").show();
  }else{
      $(this).parent().find(".form_class").hide();
  }
});

document.querySelectorAll('.update-button').forEach(x=>{
x.disabled = true;
});

document.querySelectorAll('.return-button').forEach(x=>{
x.disabled = true;
});


$('input[name="order[status]"]').change(function() {
  document.querySelectorAll('.return-button').forEach(x=>{
  x.disabled = false;
  });
});

// console.log(document.getElementsByClassName('finish_date'));
// console.log(document.getElementById("finish_date").value);
$('.finish_date').change(function() {
  const delIndex = $('.finish_date').index(this);
  console.log(delIndex);
  var d1 = new Date($(this).data("start-date"));
  var d2 = new Date(document.querySelectorAll('.finish_date')[delIndex].value);
  var d3 = new Date($(this).data("finish-date"));
  var d4 = d2 - d3
  if (d4 > 0){
    document.querySelectorAll('.update-button').forEach(x=>{
    x.disabled = false;
    });
    get_date(d1, d2)
  }
});

function get_date(start_date, finish_date){
  if (start_date && finish_date){
    var date = (finish_date - start_date)/(24*60*60*1000);
    $('#date').text(date + '日間');
    if (Math.sign(date) != -1){
      document.querySelectorAll('.update-button').forEach(x=>{
      x.disabled = false;
      });
      var q = document.createElement('input');
      q.type = 'hidden';
      q.name = "day";
      q.value = date;
      document.forms[0].appendChild(q);
    }
  }else{
    alert ('利用期間の入力に誤りがあります');
    return
  }
}