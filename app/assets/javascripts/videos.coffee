# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

checkStars = (amount) ->
  for i in [1..5]
    $("span[data-score='#{i}']").text("☆")
  for i in [1..amount]
    $("span[data-score='#{i}']").text("★")

$ ->
  stars = $("#rate").attr('rated')
  if stars > 0
    checkStars(stars)

  $("span[data-score]").on 'click', ->
    index = $(this).data("score")   
    path = window.location.pathname
    $.ajax
      type: 'POST'
      url: path + '/vote'
      data: $.param(video:
          rate: index)
    checkStars(index)
    $('#score').load(location.pathname + " #score");
    
