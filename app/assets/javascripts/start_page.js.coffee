# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $(".edit").click ->
    $(this).parent().siblings(".title").toggle()
    $(this).parent().parent().find(".project-title").find(".edit-form").toggle()
    $(this).parent().parent().parent().find(".content").toggle()
    $(this).parent().parent().parent().find(".edit-form").toggle()
    return


$(".project-title").hover (->
  $(this).children(".edit_project").children(".pull-right").fadeIn "slow"
  return
), ->
  $(this).children(".edit_project").children(".pull-right").fadeOut "slow"
  return


  return
