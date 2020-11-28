window.addEventListener("load", function() {
  // タブのDOMを取得し、変数で定義
  let tabs = document.getElementsByClassName("menu__list");
  // tabsを配列に変換する
  tabsAry = Array.prototype.slice.call(tabs);

  // タブのDOMを取得し、変数で定義
  let displays = document.getElementsByClassName("display");
 
  // tabsを配列に変換する
  displaysAry = Array.prototype.slice.call(displays);

  console.log('comment');
  // クラスの切り替えをtabSwitch関数で定義
  function tabSwitch() {

    $('.menu__list').removeClass('active');

    $(this).addClass('active');

    document.getElementsByClassName("active")[0].classList.remove("active");

    // クリックしたタブにactiveクラスを追加
    this.classList.add("active");
    


    // 何番目の要素がクリックされたかを、配列tabsから要素番号を取得
    let index = tabsAry.indexOf(this);

    $(".display").removeClass('second-display');
    document.getElementsByClassName("display")[index].classList.add("second-display");
  }

  // タブメニューの中でクリックイベントが発生した場所を探し、下で定義したtabSwitch関数を呼び出す
  tabsAry.forEach(function(value) {
    value.addEventListener("click", tabSwitch);
  });
});
