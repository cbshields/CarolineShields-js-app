$(function(){
  // console.log("players.js loaded")
  $("a.load_sports").on("click", function(e){
    e.preventDefault()

    $.ajax({
      method: "GET",
      url: this.href,
      dataType: "json"
    }).done(function(response) {
      const playerSport = new Sport(response)
      // player.playerhHTML()
      //debugger
      //do I need to create 2 constructor objects or have everything I need in one?
      $(`div.sport_list-${playerSport.id}`).html(playerSport.sportHTML())
    })
  })

  $("a.player_details").on("click", function(e) {
    e.preventDefault()

    $.ajax({
      method: "GET",
      url: this.href,
      dataType: "json"
    }).done(function(response){
      debugger
    })
  })
})


class Sport {
  constructor(obj) {
    this.id = obj.id
    this.name = obj.name
    this.sports = obj.sports
  }
}

Sport.prototype.sportHTML = function() {
  let sports = this.sports
    // console.log(`here is the sports array: ${sports}`)
  return sports.map(function(sport) {
    //console.log(`here is the singular instance of sport: ${sport.name}`)
    return (`<li>${sport.name}</li>`)
  })
}

class Player {
  constructor(obj) {
    this.id = obj.id
    this.name = obj.name
    this.age = obj.age
    this.address = obj.address
  }
}
