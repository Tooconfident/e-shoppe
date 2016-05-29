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
      $("tr#" + id).remove()
      $(".total_cost").replaceWith(msg)
    })
  })

  $('.edit-link').one('click', function(event){
    event.preventDefault()
    var link = $(this).attr('href')
    var id = $(this).attr('id')
    $.ajax({
      method: "get",
      url: link,
    }).done(function(msg){
      $(".edit-form-holder").append(msg)

    })
  })

  $(".edit-form-holder").on('submit', ".edit_order", function(event){
    event.preventDefault()
    var data = $(this).serialize()
    var link = $(this).attr('action')
    var id = $(this).attr('id')
    $.ajax({
      method: "put",
      url: link,
      data: data
    }).done(function(msg){
      console.log(msg)
      $(".edit-form-holder").hide()
      console.log($(id));
      $("tr#" + id).html(msg)
    })
  })

})
