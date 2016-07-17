

$(document).ready(function(){
  $(".ajax-upvote").click(function(){
    console.log("Upvote click");

    var clicked = $(this);
    var postId = clicked.data("post-id");
    var subcheckitId = clicked.data("subcheckit-id");
    console.log(postId);
    console.log(subcheckitId);

    $.ajax("/subcheckits/" + subcheckitId + "/posts/" + postId + "/vote", {
      method: "POST",
      data: { vote: "up"},
      error: function() { alert("Something went wrong!")},

      success: function() {
        // alert("Vote should have saved");
        clicked.closest("tr").find(".orange").removeClass("orange")
        clicked.addClass("orange")
      }
    })

  }); // End


  $(".ajax-downvote").click(function(){
    console.log("Downvote click");

    var clicked = $(this);
    var postId = clicked.data("post-id");
    var subcheckitId = clicked.data("subcheckit-id");

    console.log(postId);
    console.log(subcheckitId);

    $.ajax("/subcheckits/" + subcheckitId + "/posts/" + postId + "/vote", {
      method: "POST",
      data: { vote: "down"},
      error: function() { alert("Something went wrong!")},

      success: function() {
        clicked.closest("tr").find(".orange").removeClass("orange")
        clicked.addClass("orange")
      }
    })

    $.ajax("/subcheckits/" + subcheckitId + "/posts/" + postId + "/vote", {
      method: "POST",
      data: { vote: "down"},
      error: function() { alert("Something went wrong!")},

      success: function() {
        clicked.closest("tr").find(".orange").removeClass("orange")
        clicked.addClass("orange")
      }
    })




  }); // End

});
