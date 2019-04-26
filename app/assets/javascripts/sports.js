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
            // debugger
            document.getElementById('sport_list').innerHTML += sportListHTML
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

  class Sport {
    constructor(obj) {
      this.id = obj.id
      this.name = obj.name
    }
  }

  Sport.prototype.displayName = function() {
    return (`
      <h1>Sport: ${this.name}</h1>

      `)
  }

  Sport.prototype.displayList = function() {
    return (`
      <p>${this.name}</p>

      `)
  }

})
