$('.update_button').click(function() {
  if($('.select_box').val() == "貸出中"){
    $(".receiver").remove();
  }else if($('.select_box').val() == "返却済"){
    $(".lender").remove();
  }else{
    $(".receiver").remove();
    $(".lender").remove();
  }
});