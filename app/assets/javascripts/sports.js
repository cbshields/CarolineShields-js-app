$(function(){
  // console.log("sports.js loaded")

  $("#new_sport").on("submit", function(e) {
    e.preventDefault
    const values = $(this).serialize()
    $.post("/sports", values).done(function(data) {

      console.log(data)

    })

  })



})
