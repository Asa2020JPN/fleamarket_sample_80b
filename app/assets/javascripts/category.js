$(function() {
  // 子カテゴリーにてoptionタグの作成
  function appendOption(category) {
    let html = 
      `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`
    return html;
  }

// 子カテゴリーの表示作成
  function appendChildrenBox(insertHTML) {
    let childrenSelectHtml = '';
    childrenSelectHtml = `<div class="input-string__category" id="child-wrapper">
    <select class="input-string__category--form" id="child-category" name="product[category_id]"><option value="", data-category="">選択してください</option>
    ${insertHTML}
    </select>
    </div>`;
    $('.input-string__category').append(childrenSelectHtml);
  }

// 孫カテゴリーの表示作成
  function appendGrandchidrenBox(insertHTML){
    let grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class="input-string__category" id="grandchild-wrapper">
    <select class="input-string__category--form" id="grandchild-category" name="product[category_id]"><option value="">選択してください</option>
    ${insertHTML}
    </select>
    </div>`;
    $('#child-wrapper').append(grandchildSelectHtml);
  }


// 親カテゴリー選択後のイベント
  $("#parent-category").on('change', function () {
    let parentID = $("#parent-category").val();    
    if (parentID != "") { //親カテゴリーが初期値でないことを確認してAjax通信を開始
      $.ajax( {
        type: 'GET',
        url: '/products/get_category_children',
        data: { parent_id: parentID },
        dataType: 'json'
      })
        .done(function (children) {
          // console.log(children);
        $('#child-wrapper').remove(); //親が変更された時、子以下を削除する
        let insertHTML = '';
        children.forEach(function(children){
          insertHTML += appendOption(children);
        });
        appendChildrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      });
    }
    else { //親カテゴリーが初期値の場合は、子以下を削除する
      $('#child-wrapper').remove();
    }
  });
// 子カテゴリー選択後のイベント
  $('.input-string__category').on('change', '#child-category', function(){
    let childID = $('#child-category option:selected').data('category');
    if (childID != "") { //子カテゴリーが空でないことを確認してAjax通信を開始
      $.ajax({
        type: 'GET',
        url: '/products/get_category_grandchildren',
        data: { child_id: childID },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if(grandchildren.length != 0) {
          $('#grandchild-wrapper').remove(); //子が変更された時、孫を選択し直す
          let insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      .fail(function() {
        alert('カテゴリー取得に失敗しました');
      });
    }
    else { //子カテゴリーが初期値の場合は、孫以下を削除する
      $('#grandchild-wrapper').remove();
    }
  });
});