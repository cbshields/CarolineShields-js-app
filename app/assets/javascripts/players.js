$(function() {
  $("a.load_sports").on("click", function(e) {
    $.ajax({
      method: "GET",
      url: this.href
    }).done(function(response) {
      $("div.sport_list").html(response)
    })



    e.preventDefault()
  })
})
