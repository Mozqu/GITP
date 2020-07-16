$(function() {


  var id = 0;
  $('#camera').change(function() {
    if (id < 4) {
      var file = this.files[0];
      var reader = new FileReader();
      reader.readAsDataURL(file);
        //読み込み時に発火するイベント
        reader.onload = function() {
          var image = reader.result;
          $('#camera').before(`<img id="image-preview_${id}"  class="image-preview" src="" alt="preview">`);
          $(`#image-preview_${id}`).attr('src', image);
          id += 1;
        }
      } else {
        alert('画像は４枚まで投稿出来ます')
      }
    })
})
