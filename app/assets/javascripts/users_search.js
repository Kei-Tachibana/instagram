$(document).ready(function(){
  $("#users-search #term").on("keyup", function(){
    let jqxhr = $.get(
      $("#users-search").attr("action"),
      {term: $("#users-search #term").val()},
      function(){
        let result = $("#users-search").html();
        if(!result){
          $("#users-search #term").popover({
            content: "No result found",
            placement: "bottom",
            html: true,
            trigger: "focus",
          });
        } else {
          $("#users-search #term").popover({
            content: $("#users-result"),
            placement: "bottom",
            html: true,
            trigger: "focus",
          });
        }
        $("#users-search #item").popover("show");
      }
    )
  })
});
