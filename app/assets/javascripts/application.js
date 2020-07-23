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

  //postを読み込み時に実行する
  $('.post-main').each(function(){
    var sentenceHeight = $(this).children('.post-sentence').css("height");
    sentenceHeight = parseInt(sentenceHeight)
    var imageHeight = $(this).children('.post-images').css('height');
    imageHeight = parseInt(imageHeight);
    //条件で開くボタンを設置
    if(sentenceHeight >= 300 || imageHeight >= 450){
      $(this).children('.item-open').css('display', 'flex');
    }
    //ハッシュタグ切り分けてpタグに変換
    var htmlTags = new Array();
    var tags = $(this).find(".post-tags").text();
    if (tags.trim() != ""){
      splitTags = tags.split(" ").filter(Boolean);
      for(let i = 1; i < splitTags.length; i++){
        var x = i - 1;
        htmlTags[x] =  '<p class="tags-link">' + splitTags[i] + '</p>'
      }
      htmlTags = htmlTags.join("");
      $(this).find(".post-tags").html(htmlTags);
    } else {
      $(this).find(".post-tags").remove();
    }
  })

  //hashtagsをクリックしたときに検索フォームに代入
  $(".tags-link").click(function(){
    var word = $(this).text();
    var sortWord = $("#sort-word").val();
    word = sortWord + " " + word;
    $("#sort-word").val(word);
  })


  $('.item-open').click(
    function() {
      $(this).fadeOut();
      $itemSentence = $(this).prev();
      $itemImage = $itemSentence.prev();
      $itemSentence.css('max-height', 'none');
      $itemImage.css('max-height', 'none');
      var $grid = jQuery('#show-center').imagesLoaded(function(){
      $grid.masonry({
        itemSelector: '.item',
        });
      });

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
    /*post-new*/
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
    /* user-menu-modal */
    var userMenuState = false
    $('#user-menu-close').click(function(){
      if (userMenuState) {
        $('#user-menu-modal').slideUp();
        $('#user-menu-close').css('display', 'none');
        userMenuState = false;
      }
    })
    $('#user-menu-modal-show').click(function(){
      if (userMenuState == false) {
        $('#user-menu-modal').slideDown();
        $('#user-menu-close').css('display', 'block');
        userMenuState = true;
      }
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
