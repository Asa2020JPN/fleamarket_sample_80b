$(document).on('turbolinks:load', function () {
  //購入ボタンを押すと、モーダル画面を表示させる
  $('.btn--purchase').on('click', function () {
    $('.buy-button-modal').show();
    $('.sign_modal').show();
    if ($(this).hasClass('sign_up_button')) {
      $('.sign_up_modal').show();
    }
  });

  //キャンセルボタンを押した後にモーダル画面を消す
  $('.cancel-button').off().click(function () {
    $('.buy-button-modal').fadeOut();
  })
}); 
