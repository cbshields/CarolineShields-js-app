$(function(){
  // console.log("sports.js loaded")

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

})
