$(document).on('turbolinks:load', function() {
  Payjp.setPublicKey('');
  $(document).on("click", "#token_submit", function(e) {
    e.preventDefault();
    $('.icon_load').show();

    var card = {
      number: $("#card_number").val(),
      exp_month: $("#exp_month").val(),
      exp_year: $("#exp_year").val(),
      cvc: $("#cvc").val()
    };

    Payjp.createToken(card, function(status, response) {
      if (status === 200) {
        $("#card_number").removeAttr("name");
        $("#exp_month").removeAttr("name");
        $("#exp_year").removeAttr("name");
        $("#cvc").removeAttr("name");
        $("#card_token").append($('<input type="hidden" name="payjp-token">').val(response.id));
        document.inputForm.submit();
      } else {
        alert("カード情報が正しくありません。");
        $('.icon_load').hide();
      }
    });
  });
});