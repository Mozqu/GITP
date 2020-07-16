$(function() {


  var id = 0;
  var target = "#camera0"
  $(document).on('change', '.hidden-field', function() {
    if (id < 4) {
      alert("hi");
      var file = this.files[0];
      var reader = new FileReader();
      reader.readAsDataURL(file);
        //読み込み時に発火するイベント
        reader.onload = function() {
          var image = reader.result;
          var targetId = "image-preview_" + id;
          var targetIdS = "#" + targetId;
          $('#camera').before('<div class="image-preview-container"><img id="' + targetId + '" class="image-preview" src="" alt=""><i id="' + targetId + '-close" class="fa fa-window-close" aria-hidden="true"></i></div>');
          $(targetIdS).attr('src', image);
          id += 1;
          //labelのforを変える
          $('#camera').attr('for', 'camera' + id);
          target = "#camera" + id;
          alert(target);
        }
      } else {
        alert('画像は４枚まで投稿出来ます')
      }
    })//change, hidden-field


})
