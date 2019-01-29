$(function(){
  // console.log("players.js loaded")
  $("a.load_sports").on("click", function(e){
    e.preventDefault()

    $.ajax({
      method: "GET",
      url: this.href,
      dataType: "json"
    }).done(function(response) {
      const player = new Player(response)
      debugger
      // player.playerhHTML()
      // debugger
      $("div.sport_list").html(player.playerHTML())
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
  let sports = this.sports
    // console.log(`here is the sports array: ${sports}`)
  return sports.map(function(sport) {
    //console.log(`here is the singular instance of sport: ${sport.name}`)
    return (`<li>${sport.name}</li>`)
  })
}


// Player.prototype.playerHTML = function() {
//     return (`
//       <li>${this.sports}</li>
//       `)
// }
