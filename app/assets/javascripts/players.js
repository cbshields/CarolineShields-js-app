$(function(){
  // console.log("players.js loaded")

  // $("a.view_players").on("click", function(e) {
  //     e.preventDefault()
  //     console.log(this)
  //     debugger
  //     $.ajax({
  //       method: "GET",
  //       url: this.href,
  //       dataType: "json"
  //     }).done(function(players) {
  //       // how to debug what's in here
  //       //debugger or console.log doesn't seem to work
  //       // console.log(players)
  //       // const Players = players
  //     })
  // })


  // $("a.load_sports").on("click", function(e){
  //   e.preventDefault()
  //   $.ajax({
  //     method: "GET",
  //     url: this.href,
  //     dataType: "json"
  //   }).done(function(response) {
  //     const player = new Player(response)
  //     const playerInfo = player.playerHTML()
  //     const sportInfo = player.sportHTML()
  //     $(`div.sport_list-${player.id}`).html(playerInfo + sportInfo)
  //     //$(`div.sport_list-${playerSport.id}`).html(playerSport.sportHTML())
  //
  //   })
  // })

  $("a.player_details").on("click", function(e) {
    e.preventDefault()

    $.ajax({
      method: "GET",
      url: this.href,
      dataType: "json"
    }).done(function(response){
      const player = new Player(response)
      const playerInfo = player.playerHTML()
      const sportInfo = player.sportHTML()
      $(`div.sport_list-${player.id}`).html(playerInfo + sportInfo)
       // html(playerInfo + sportInfo)
      // $(`div.player_info-${player.id}`).html(player.playerHTML())
    })
  })

  $("a#new-sport-position").on("click", function(e) {
    e.preventDefault()
    console.log(this)
    debugger
  })
})


class Player {
  constructor(obj) {
    this.id = obj.id
    this.name = obj.name
    this.age = obj.age
    this.address = obj.address
    this.sports = obj.sports
  }
}
Player.prototype.sportHTML = function() {

  let sports = this.sports
    // console.log(`here is the sports array: ${sports}`)
  return sports.map(function(sport) {
    //console.log(`here is the singular instance of sport: ${sport.name}`)
    return (`<p>${sport.name}</p>`)
  }).join('')
}


Player.prototype.playerHTML = function() {
  return (`
    <p>Age: ${this.age}</p>
    <p>Address: ${this.address}</p>
    <p><b>Sports:</b></p>

    `)
}
