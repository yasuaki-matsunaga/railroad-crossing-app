// 取得したテキストをhtmlに変換する関数
function stringToHTML(str) {
  var dom = document.createElement('div');
  dom.innerHTML = str;
  return dom.firstElementChild;
};

//検索セレクトボックスを動的に変化させる
document.addEventListener('turbo:load', function () {
  const selectPrefecture = document.getElementById("select-prefecture");
  const defaultCitySelect = `<select class="form-select shadow mt-3" id="select-city" name="q[city_city_id_eq]">
  <option value>市町村</option>
  </select>`;

  selectPrefecture.addEventListener('change', function() {
    if (selectPrefecture.value !== '') {
      const selectCity = document.getElementById("select-city");
      selectCity.remove();

      // 選択されたカテゴリーに応じたHTMLを挿入
      let selectedTemplate = document.querySelector(`#city-of-prefecture${selectPrefecture.value}`);
      selectPrefecture.after(stringToHTML(selectedTemplate.innerHTML));

    } else {
      const selectCity = document.getElementById("select-city");
      // サブカテゴリー選択用のセレクトボックスを削除
      selectCity.remove();
      // ダミーのセレクトボックスを挿入
      selectPrefecture.after(stringToHTML(defaultCitySelect));
    };
  });
});