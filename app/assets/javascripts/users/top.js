$('input[name="order[return_status]"]').parent().find(".form_class").hide();
$('input[name="order[return_status]"]').change(function(){
  if($(this).val() == "2"){
      $(this).parent().find(".form_class").show();
  }else{
      $(this).parent().find(".form_class").hide();
  }
});

document.getElementById("button").disabled = true;
  document.getElementById("button2").disabled = true;

  $('input[name="order[status]"]').change(function() {
    document.getElementById("button2").disabled = false;
  });


  $('.finish_date').change(function() {
    var d1 = new Date($(this).data("start-date"));
    var d2 = new Date(document.getElementById("finish_date").value);
    var d3 = new Date($(this).data("finish-date"));
    var d4 = d2 - d3
    if (d4 > 0){
      document.getElementById("button").disabled = false;
      get_date(d1, d2)
    }else{
      document.getElementById("button").disabled = true;
    }
  });

  function get_date(start_date, finish_date){
    if (start_date && finish_date){
      var date = (finish_date - start_date)/(24*60*60*1000);
      $('#date').text(date + '日間');
      if (Math.sign(date) != -1){
        document.getElementById("button").disabled = false;
        var q = document.createElement('input');
        q.type = 'hidden';
        q.name = "day";
        q.value = date;
        document.forms[0].appendChild(q);
        console.log(document.forms[0]);
      }
    }else{
      alert ('利用期間の入力に誤りがあります');
      return
    }
  }