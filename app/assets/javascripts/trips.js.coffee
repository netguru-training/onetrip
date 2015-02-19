$(document).on "ready page:load", ->
  $(".datetimepicker").datetimepicker 
    language: "en"
    minDate: new Date()
    format: "YYYY-MM-D hh:mm"

  $("#quick_message").hide()
  
  $("#show_message_form").click ->
    $("#quick_message").toggle(800)
  
  $("input[type='submit']").click ->
    $("#quick_message").hide(200)
