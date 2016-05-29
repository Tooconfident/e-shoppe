// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
  $('#cart-form').on('submit', function(event){
    event.preventDefault()
    var link = $(this).attr('action')
    var data = $(this).serialize()
    console.log(link)
    console.log(data)
    $(this).hide()
    $.ajax({
      method: "get",
      url: link,
      data: data
    }).done(function(msg){
      $('.ajax-target').html(msg)
    })
  })

})
