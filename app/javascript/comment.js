window.addEventListener("load", function() {
  // タブのDOMを取得し、変数で定義
  let tabs = document.getElementsByClassName("menu__list");
 
  // tabsを配列に変換する
  tabsAry = Array.prototype.slice.call(tabs);

  console.log('comment');
  // クラスの切り替えをtabSwitch関数で定義
  function tabSwitch() {
    console.log('clicked');
    console.log(this);

    $('.menu__list').removeClass('active');
    $('.menu__list').addClass('non-active');

    $(this).removeClass('non-active');
    $(this).addClass('active');

    document.getElementsByClassName("active")[0].classList.remove("active");

    // クリックしたタブにactiveクラスを追加
    this.classList.add("active");
    

    // コンテンツの全てのshowクラスのうち、最初の要素を削除
    document.getElementsByClassName("show")[0].classList.remove("show");
    document.getElementsByClassName("no-display")[0].classList.remove("no-display");


    // 何番目の要素がクリックされたかを、配列tabsから要素番号を取得
    const index = tabsAry.indexOf(this);

    // クリックしたcontentクラスにshowクラスを追加する
    document.getElementsByClassName("content")[index].classList.add("show")
    document.getElementsByClassName("content")[index].classList.add("no-display")
  }

  // タブメニューの中でクリックイベントが発生した場所を探し、下で定義したtabSwitch関数を呼び出す
  tabsAry.forEach(function(value) {
    value.addEventListener("click", tabSwitch);
    
  });
});
