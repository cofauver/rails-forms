// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('turbolinks:load',function(){

  $('#shutoff').change(function(){
    if ($(this).prop('checked')){
      console.log('select all box checked');
      $('.notification').prop('checked', false);
      $('.notification').attr('disabled', true);

    }
    else{
      $('.notification').prop('checked', true);
      $('.notification').attr('disabled', false);
    }
  })

})
