$(function() {
  // 子カテゴリーにてoptionタグの作成
  function appendOption(category) {
    let html = 
      `<option value="${category.name}" data-category="${category.id}">${category.name}</option>`
    return html;
  }
// 子カテゴリーの表示作成
  function appendChildrenBox(insertHTML) {
    let childrenSelectHtml = '';
    childrenSelectHtml = `<div class="input-string" id="child-wrapper">
    <select class="input-string__form" id="child-category" name="product[category]"><option value="">選択してください</option>
    ${insertHTML}
    </select>
    </div>`;
    $('.input-string').append(childrenSelectHtml);
  }
// 親カテゴリー選択後のイベント
  $("#parent-category").on('change', function(){
    // console.log(this)
    let parentCategory = $("#parent-category").val();
    // debugger
    if (parentCategory != "選択してください") { //親カテゴリーが初期値でないことを確認してAjax通信を開始
      $.ajax( {
        type: 'GET',
        url: 'get_category_children',
        data: { parent_name: parentCategory },
        dataType: 'json'
      })
      .done(function(children) {
        // console.log(children)
        $('#child-wrapper').remove(); //親が変更された時、子以下を削除する
        $('#child-category').remove();
        // let html = appendOption(children)
        // console.log(html)
        let = insertHTML = '';
        children.forEach(function(children) {
          insertHTML += appendOption(children);
        });
        // console.log(insertHTML)
        appendChildrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      }) 
    }
    else { //親カテゴリーが初期値の場合は、子以下を削除するする
      $('#child-wrapper').remove();
      $('#child-category').remove(); 
    }
  })
// 子カテゴリー選択後のイベント
  $('.input-string').on('change', '#child-category', function(){
    console.log(this);
    let childID = $('#child-category option:selected').data('category');
    // debugger
    // let childCategory = $("#child-category option:selected").val();
    // console.log(childCategory)
    // debugger
  })
})