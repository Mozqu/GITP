$(function() {



  $(document).on('change', '.hidden-field', function() {
    var id = $(this).attr('id').replace(/[^0-9]/g, '');
    var file = this.files[0];
    var reader = new FileReader();
    reader.readAsDataURL(file);
    //読み込み時に発火するイベント
    reader.onload = function() {
      var image = reader.result;
      var targetId = "image-preview_" + id;
      var targetIdS = "#" + targetId;
      $('#camera' + id).before('<div class="image-preview-container"><img id="' + targetId + '" class="image-preview" src="" alt=""><span class="unshow"><i id="' + targetId + '-close" class="fa fa-times-circle delete-image-preview" aria-hidden="true"><div class="remove-button"></div></i></span></div>');
      $(targetIdS).attr('src', image);
      //空いてるinputのidを取得
      //labelのforを変える
    }
    $('#label' + id).fadeOut();
  })//change, hidden-field

    // 画像の削除
    $(document).on('click', '.delete-image-preview', function() {
      var count = $('.image-preview-container').length;
      var deleteId = $(this).attr('id').replace(/[^0-9]/g, '');
      deleteId = Number(deleteId);
      //取得したidに該当するプレビューを削除
      $('#camera' + deleteId).val(null);
      $('#image-preview_' + deleteId).parent().remove();
      $('#label' + deleteId).fadeIn();

    });

    $(document).on({
      'mouseenter' : function() {
        $(this).children('.unshow').fadeIn();
      },
        'mouseleave' : function(){
          $(this).children('.unshow').fadeOut();
      }
      },
      '.image-preview-container');
})
