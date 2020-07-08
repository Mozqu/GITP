$(function(){

  $(document).on('click', '#board-new-modal-show', function(){
    $modal = $('#commu-board-modal');
    $modal.fadeIn();
    $('body').css('overflow', 'hidden');
  });
  $(document).on('click', '#post-new-close', function(){
    $modal = $('#commu-board-modal');
    $modal.fadeOut();
    $('body').css('overflow', 'scroll');
  })

})
