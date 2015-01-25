$(document).on "ready page:load", ->
  
  $('.chosen-select').chosen
    allow_single_deselect: true
    no_results_text: 'No results matched'
    width: '200px'

  $("#trips-search input[type='checkbox']").on "change", ->
    $("#trips-search").submit()

  $("input[type='checkbox']").checkbox()
