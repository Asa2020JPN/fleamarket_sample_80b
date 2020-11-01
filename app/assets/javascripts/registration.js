$(function() {
  function insertStr(input){
    console.log('-入');
    return input.slice(0, 3)+ '-' + input.slice(3,input.length);
  }

  function display(removeHyphen){
    console.log('display');
    return removeHyphen
  }

  $("#address_postcode").on('keyup',function(e){
    console.log('keyup');
    // 入力した全て、this: タグ
    var input = $(this).val();
    // 入力された文字取得（１文字）
    var inputValue = input.substr(input.length - 1, 1);
    // 入力された文字の一文字前取得
    var beforeInputValue = input.substr(input.length - 2, 1);

    console.log(inputValue);
    console.log(beforeInputValue);

    //削除キーではハイフン追加処理が働かないように制御（8がBackspace、46がDelete)
    var key = event.keyCode || event.charCode;
    if( key == 8 || key == 46 ){
      console.log('削除');
      if (inputValue == '-') {
        var removeHyphen = input.replace(/-/g, '');
        $(this).val(display(removeHyphen));
      }
      return false;
    }

    // ４桁目に値が入ったら発動 
    // (input.length === 4 && input.substr(3,1) !== '-' && input.substr(input.length - 2, 1) == '-')
    if(input.length === 4 && inputValue !== '-' && beforeInputValue != '-') {
      console.log('ok!');
      $(this).val(insertStr(input));
    }

    // input.substr(input.length - 1, 1) != input.substr(3,1)
    if (inputValue != '-' && beforeInputValue == '-') {
      // -全て削除
      var removeHyphen = input.replace(/-/g, '');
      console.log('ハイフン全消し');

      if (removeHyphen.length < 4) {
        console.log('< 4');
        $(this).val(display(removeHyphen));
      } else if (removeHyphen.length > 3) {
        console.log('> 3');
        $(this).val(insertStr(removeHyphen));
      } else {
        console.log('?');
      }

    }
  });

  $("#address_postcode").on('blur',function(e){
    var input = $(this).val();
    console.log('blur');
    // ４桁目が'-(ハイフン)’かどうかをチェックし、違ったら挿入
    if(input.length >= 3 && input.substr(3,1) !== '-'){
      $(this).val(insertStr(input));
      console.log('blur_挿入');
    }
  });
});