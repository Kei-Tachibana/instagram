$(document).ready(function(){
  let target = $("#term");
  target.on("keyup", function(){
    $.get(
      $("#users-search").attr("action"),
      {term: target.val()},
      function( result ){
        target.popover("dispose");
        if (!result) {
          return;
        }
        target.popover({
          content: result,
          placement: "right",
          html: true,
          trigger: "manual",
        });
        target.popover("show");
      }
    )
  });
});
