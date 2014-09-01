# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


editfunc = ->
  $(".edit").click ->
      $(this).parent().siblings(".title").toggle()
      $(this).parent().parent().find("span.input-append").find(".edit-form").toggle()
      $(this).parent().parent().parent().children(".maincol").find(".content").toggle()
      $(this).parent().parent().parent().children(".maincol").find(".edit-form").toggle()


$(document).ready(editfunc)
