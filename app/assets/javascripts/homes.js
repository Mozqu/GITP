$(function() {

  

  $('#camera').change(function() {

    var file = this.files[0];
    var reader = new FileReader();
    reader.readAsDataURL(file);
      //読み込み時に発火するイベント
      reader.onload = function() {
        alert('hello');
        var image = reader.result;
        $('#camera').before('<img id="image-preview_#{id}" class="image-preview" src="" alt="preview">');
        $('.image-preview').attr('src', `${image}`);
      }


  })



})
