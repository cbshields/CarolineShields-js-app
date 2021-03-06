$(function(){
  // console.log("players.js loaded")

  // $("a.view_players").on("click", function(e) {
  //     e.preventDefault()
  //     $.ajax({
  //       method: "GET",
  //       url: this.href,
  //       dataType: "json"
  //     }).done(function(players) {
  //       players.map(player => {
  //         const player = new Player(player)
  //         const
  //
  //       })
  //       $(`div.player_list`).html(playerListHTML)
  //       let playerListHTML = playerList.map(function(player) {
  //       // `<li><a class="player_details" href="/players/${player.id}">${player.name}</a></li><br><br><div class="player_info-${player.id}>"></div>`
  //       debugger
  //         return (`<li><a class="player_details" href="/players/${player.id}">${player.name}</a></li>`)
  //       }).join('')
  //       $(`div.player_list`).html(playerListHTML)
        // console.log(`Players are: ${players}`)

        // debugger
      // })
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
      $(`div.player_info-${player.id}`).html(playerInfo + sportInfo)
       // html(playerInfo + sportInfo)
      // $(`div.player_info-${player.id}`).html(player.playerHTML())
    })
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
