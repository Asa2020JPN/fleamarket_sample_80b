$(document).on('turbolinks:load', function () {
  //購入ボタンを押すと、モーダル画面を表示させる
  $('.btn--purchase').on('click', function () {
    $('.sign_modal_wrapper').show();
    $('.sign_modal').show();
    if ($(this).hasClass('sign_up_button')) {
      $('.sign_up_modal').show();
    }
  });

  //キャンセルボタンを押した後にモーダル画面を消す
  $('.cancell-button').off().click(function () {
    $('.sign_modal_bg').fadeOut();
  })
}); 
