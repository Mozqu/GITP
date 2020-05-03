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
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery
//= require jquery_ujs



$(function() {
  var flag = false;
  $('.post-item').click(
    function() {

      if (flag){
        flag  = false;
        $item = $(this).children('.post-images');
        $item.css('maxHeight', '500px');

        var $grid = jQuery('#show-center').imagesLoaded(function(){
        $grid.masonry({
          itemSelector: '.item',
          isFitWidth: true
          });
        });


    }else {
      flag = true;
      $item = $(this).children('.post-images');
      $item.css('maxHeight', 'none').height();
      //$item.height(closeHeight).animate('height', openHeight);
      //masonry

      var $grid = jQuery('#show-center').imagesLoaded(function(){
        $grid.masonry({
            itemSelector: '.item',
            isFitWidth: true
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
    )

});




/*
$('.post-item').hover(
    function(){
      $item = $(this).children('.post-images');
      closeHeight = $item.height();
      openHeight = $item.css('maxHeight', 'none').height();
      //$item.height(closeHeight).animate('height', openHeight);
      //masonry

      jQuery('#show-center').imagesLoaded(function(){
        $grid.masonry({
            itemSelector: '.post-item',
            isFitWidth: true
          });
      });
    },
    function(){
        //マウスアウト処
        //現在のheight取得
        $(this).children('.post-images').removeClass('item-open');

        jQuery('#show-center').imagesLoaded(function(){
        $grid.masonry({
          itemSelector: '.post-item',
          isFitWidth: true
          });
        });

      }
    );
 */
