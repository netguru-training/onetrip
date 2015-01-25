$(document).on "ready page:load", ->
  $(".datetimepicker").datetimepicker 
    language: "en"
    minDate: new Date()
    format: "YYYY-MM-D hh:mm"