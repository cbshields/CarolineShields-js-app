$(function(){
  console.log("players.js loaded")
  $("a.load_sports").on("click", function(e){
    e.preventDefault()

    $.ajax({
      method: "GET",
      url: this.href,
      dataType: "json"
    }).done(function(response) {
      debugger
      $("div.sport_list").html(response)
    })


  })
})


class Player {
  constructor(obj) {
    this.name = obj.name
    this.sports = obj.sports
  }
}

Player.prototype.playerHTML = function() {
  return (`
    <p>${this.name}</p>
    `)
}
// $(function() {
//   $("a.load_sports").on("click", function(e) {
//     alert("You clicked on the link")
//     e.preventDefault()
//   })
// })
// $(document).ready(function() {
//   $("a.load_sports").on("click", function(e) {
//       alert("You clicked on the link")
//       e.preventDefault()
//     })
//   })
