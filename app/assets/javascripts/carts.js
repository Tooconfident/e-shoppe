// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
  $('.remove-link').on('click', function(event){
    event.preventDefault()
    event.stopPropagation()
    var link = $(this).attr('href')
    var id = $(this).attr('id')
    $.ajax({
      method: "delete",
      url: link,
    }).done(function(msg){
      console.log(msg)
      $("tr#" + id).remove()
    })
  })

  $('.edit-link').on('click', function(event){
    event.preventDefault()
    var link = $(this).attr('href')
    var id = $(this).attr('id')
    console.log(link)
    $.ajax({
      method: "get",
      url: link,
    }).done(function(msg){
      console.log(msg)
      $(".edit-form-holder").append(msg)
    })
  })

})
