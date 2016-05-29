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
      $("tr#edit_order_" + id).remove()
      $(".total_cost").replaceWith(msg)

    })
  })

  $('.edit-link').on('click', edit);

  function edit(event){
    event.preventDefault()
    $(".edit-form-holder").html("")
    $(".edit-form-holder").show()
    var link = $(this).attr('href')
    var id = $(this).attr('id')
    $(".button_to").hide()
    $.ajax({
      method: "get",
      url: link,
    }).done(function(msg){
      $(".edit-form-holder").append(msg)
    })
  }

  $(".edit-form-holder").on('submit', ".edit_order", function(event){
    event.preventDefault()
    var data = $(this).serialize()
    var link = $(this).attr('action')
    var id = $(this).attr('id')
    $(".edit-form-holder").html("")
    $.ajax({
      method: "patch",
      url: link,
      data: data,
      dataType: "json"
    }).done(function(hash){
      $(".button_to").show()
      $(".edit-form-holder").hide()
      $(".total_cost").text(hash.grand_total)
      $("tr#" + id + " > .price").text("$ "+ hash.total)
      $("tr#" + id + " > .quantity").text( hash.quantity )
    })
  })

})
