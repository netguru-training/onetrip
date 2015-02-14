$(document).on "ready page:load", ->
  console.log("ddd")
  $(".datetimepicker").datetimepicker 
    language: "en"
    minDate: new Date()
    format: "YYYY-MM-D hh:mm"

  $("#show_message_form").click ->
    console.log("ddd")
    $("#new_message").show()
