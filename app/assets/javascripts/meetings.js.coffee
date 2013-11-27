# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#meeting_will_be_on').datepicker
    dateFormat: 'dd.mm.yy'
  $('.date_picker').datepicker
    dateFormat: 'dd.mm.yy'
    
$("#form").on "ajax:beforeSend", (evt, xhr, settings) ->  
  # prevent double submit
  $(":submit", this).click ->
    false
    
jQuery ->
    $(".pasttimes").click ->
        alert("Дата прошла. Добавление/удаление или редактирование заседаний за прошедшие даты не допускается.")