$( document ).ready(function(){
  $(".count").keyup(function(){
    var tweetText = $(this).children($("#tweet_message")).val()
    var charactersLeft = 140 - tweetText.length
    // put intial value of charactersLeft here
    $(this).children(".char_count").text("remaining characters in tweet " + charactersLeft)

  })

})
