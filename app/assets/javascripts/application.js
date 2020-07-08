// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require activestorage
//= require jquery
//= require rails-ujs
//= require_tree .




$(function() {
  var flag = false;
  $('.post-item').click(
    function() {

      if (flag){
        flag  = false;
        $itemImage = $(this).children('.post-images');
        $itemImage.css('maxHeight', '500px');
        $itemSentence = $(this).children('.post-sentence');
        $itemSentence.css('maxHeight', '140px');

        var $grid = jQuery('#show-center').imagesLoaded(function(){
        $grid.masonry({
          itemSelector: '.item',
          });
        });


    }else {
      flag = true;
      $itemImage = $(this).children('.post-images');
      $itemImage.css('maxHeight', 'none').height();
      $itemSentence = $(this).children('.post-sentence');
      $itemSentence.css('maxHeight', 'none').height();

      var $grid = jQuery('#show-center').imagesLoaded(function(){
        $grid.masonry({
            itemSelector: '.item',
          });
        })
    }

    });

    $('.board-item').click(
      function(){
        if (flag){
          flag = false;
          $(this).children('.unshow').css("display", "none");
          var $grid = jQuery('#show-center').imagesLoaded(function(){
            $grid.masonry({
                itemSelector: '.item',
                isFitWidth: true
              });
            })//masonry
        } else {
          flag = true;
          $(this).children('.unshow').css("display", "block");

          var $grid = jQuery('#show-center').imagesLoaded(function(){
            $grid.masonry({
                itemSelector: '.item',
                isFitWidth: true
              });
            })//masonry
        }

      }
    )/*board-item*/

    $('#posts-new-modal-show').click(function(){
      $modal = $('#posts-new-modal');
      $modal.fadeIn();
      $('body').css('overflow', 'hidden');
    })
    $('#post-new-close').click(function(){
      $modal = $('#posts-new-modal');
      $modal.fadeOut();
      $('body').css('overflow', 'scroll');
    })

    var postTags = []
    $('#hash-input').keyup(function(e){
      var $inputText = $('.js-input-text');
      var $dummyInputText = $('.js-dummy-input-text');

      function updateValue(e) {
        var value = $(e.target).val();
        $(e.target).prev($dummyInputText).text(value);
      }

      $inputText.on('keyup', updateValue);
      $inputText.on('compositionend', updateValue);



      var val = $(this).val();
      if (e.keyCode === 32){
        result = val.match(/^#/);
        if(result) { /**/
          postTags.push(val);
          $('#hash-input-container').before('<div class="hash-tag-inputed">' + val + '</div>');
          $(this).val('');
        } else if (val == " " || val == ""){
          $(this).val('');
        } else {
          val = "#" + val;
          postTags.push(val);
          $('#hash-input-container').before('<div class="hash-tag-inputed">' + val + '</div>');
          $(this).val('');
        }
      }/*スペースが押されたとき*/


    });
    $('#hash-input').keydown(function(e){
      var val = $(this).val();
      /*空白でBackspace*/
      if (val == "" && e.keyCode === 8){
        $(this).parent().prev().remove();
        postTags.pop();
      }/*空白でBackspace*/
      /*tab or enter*/
      if (e.keyCode === 13 || e.keyCode === 9){
        result = val.match(/^#/);
        if(result) { /**/
          postTags.push(val);
          $('#hash-input-container').before('<div class="hash-tag-inputed">' + val + '</div>');
          $(this).val('');
        } else if (val == " " || val == ""){
          $(this).val('');
        } else {
          val = "#" + val;
          postTags.push(val);
          $('#hash-input-container').before('<div class="hash-tag-inputed">' + val + '</div>');
          $(this).val('');
        }
      }/*tab or enter*/
    });
    $('#hash-input').focusout(function(){
      var val = $(this).val();
      result = val.match(/^#/);
      if(result) { /**/
        postTags.push(val);
        $('#hash-input-container').before('<div class="hash-tag-inputed">' + val + '</div>');
        $(this).val('');
      } else if (val == " " || val == ""){
        $(this).val('');
      } else {
        val = "#" + val;
        postTags.push(val);
        $('#hash-input-container').before('<div class="hash-tag-inputed">' + val + '</div>');
        $(this).val('');
      }
      var tags = postTags.join(" ");
      $('#result').val(tags);
    });

}); /*function*/
