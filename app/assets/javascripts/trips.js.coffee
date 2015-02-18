$(document).on "ready page:load", ->
  $(".datetimepicker").datetimepicker 
    language: "en"
    minDate: new Date()
    format: "YYYY-MM-D hh:mm"

  $("#show_message_form").click ->
    $("#quick_message").show()
  
  $("input[type='submit']").click ->
    $("#quick_message").hide()