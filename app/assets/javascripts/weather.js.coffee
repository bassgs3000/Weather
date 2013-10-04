# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('.progress').each( ->
    precip = $(@).data("value")
    $(@).append("<span class='meter'></span>")
    # $("span", @).slideDown()
    $("span", @).css("width", "0%")
    $("span", @).animate(width: precip, 1500)
  )
  # $('span.meter').fadeIn(1500)
