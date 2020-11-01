$(function() {
  function insertStr(input){
    return input.slice(0, 3)+ '-' + input.slice(3,input.length);
  }

  function display(removeHyphen){
    return removeHyphen
  }

  $("#address_postcode").on('keyup',function(e){
    var input = $(this).val();
    var inputValue = input.substr(input.length - 1, 1);
    var beforeInputValue = input.substr(input.length - 2, 1);

    var key = event.keyCode || event.charCode;
    if( key == 8 || key == 46 ){
      if (inputValue == '-') {
        var removeHyphen = input.replace(/-/g, '');
        $(this).val(display(removeHyphen));
      }
      return false;
    }

    if(input.length === 4 && inputValue !== '-' && beforeInputValue != '-') {
      $(this).val(insertStr(input));
    }

    if (inputValue != '-' && beforeInputValue == '-') {
      var removeHyphen = input.replace(/-/g, '');

      if (removeHyphen.length < 4) {
        $(this).val(display(removeHyphen));
      } else {
        $(this).val(insertStr(removeHyphen));
      }
    }
  });

  $("#address_postcode").on('blur',function(e){
    var input = $(this).val();
    if(input.length >= 3 && input.substr(3,1) !== '-'){
      $(this).val(insertStr(input));
    }
  });
});