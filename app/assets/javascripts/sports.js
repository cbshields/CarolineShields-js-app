$(function(){
  // console.log("sports.js loaded")

  $("a.view_sports").on("click", function(e) {
    e.preventDefault()
    $.ajax({
          method: "GET",
          url: this.href,
          dataType: "json"
        }).done(function(sports) {
            sports.map(data => {
            const sport = new Sport(data)
            const sportListHTML = sport.displayList()
            const playerListHTML = sport.displayPlayers()
            const sportPlayerListHTML = sportListHTML + playerListHTML
            document.getElementById('sport_list').innerHTML += sportPlayerListHTML
            // debugger
          })
        })
      })

  $("#new_sport").on("submit", function(e) {
    e.preventDefault()
    const values = $(this).serialize()
    $.post("/sports", values).done(function(data) {
      $("#app-container").html("")
      const sport = new Sport(data)
      const sportName = sport.displayName()
      $("#app-container").html(sportName)
    })

  })

  $("a.view_sports_sorted").on("click", function(e) {

    e.preventDefault()
    $.ajax({
          method: "GET",
          url: this.href,
          dataType: "json"
        }).done(function(sports) {

          sports.sort(function(a, b) {
            var nameA = a.name.toUpperCase(); // ignore upper and lowercase
            var nameB = b.name.toUpperCase(); // ignore upper and lowercase
            if (nameA < nameB) {
              return -1;
            }
            if (nameA > nameB) {
              return 1;
            }

            // names must be equal
            return 0;
          });



          sports.forEach(function(sport){
            const sportObj = new Sport(sport)
            const sportListHTML = sportObj.displayList()
            document.getElementById('sport_list').innerHTML += sportListHTML

          })

          // const sportsList = sports.map(data => {
          //   const sport = new Sport(data)
          //   const sportListHTML = sport.displayList()
          //
          //   document.getElementById('sport_list').innerHTML += sportListHTML
          //   // debugger
          // })

        })
      })

  class Sport {
    constructor(obj) {
      this.id = obj.id
      this.name = obj.name
      this.players = obj.players
    }
  }

  Sport.prototype.displayName = function() {
    return (`
      <h1>Sport: ${this.name}</h1>

      `)
  }

  Sport.prototype.displayList = function() {
    return (`
      <p><b>${this.id}. ${this.name}</b></p>
      <p>Players:</p>
      `)
  }

  Sport.prototype.displayPlayers = function() {
    let players = this.players
      // console.log(`here is the sports array: ${sports}`)
    return players.map(function(player) {
      //console.log(`here is the singular instance of sport: ${sport.name}`)
      return (`<p>${player.name}</p>`)
    }).join('')
  }

})
