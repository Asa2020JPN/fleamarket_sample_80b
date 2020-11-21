$(document).on('turbolinks:load', function() {

  if ($('.credit-card')[0]) {
    $(".add-card").removeClass("add-border");
  }

  $(".enter-button").click(function() {
    $('.icon_load').show();
  });

  $(".current-user__delete--btn").click(function(e) {
    e.preventDefault();
    $("*").css('cursor', 'wait');
    
    let card_value = $(this).parent().prev().children(".credit-check").children().attr("value");
    const csrf_token = $('meta[name="csrf-token"]').attr('content');
    // debugger
    const params = location.search
    const params_id = params.replace(/[^0-9]/g, '');
    $.ajax({
      url: "/card/delete",
      type: "post",
      data: {authenticity_token: csrf_token, card_value: card_value, params_id: params_id},
      datatype: "json",
      success: function(data) {
        alert('削除しました');
      },
      error: function(data) {
        alert('error');
        $("*").css('cursor', 'pointer');
      }
    });
  });
});