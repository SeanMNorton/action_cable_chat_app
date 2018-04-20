App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    unless data.message.blank?
      $('#messages-table').append data.message
      scroll_bottom()

$(document).on 'turbolinks:load', ->
  submit_message()
  submit_message_via_click()
  scroll_bottom()

submit_message = () ->
  $('#message_content').on 'keydown', (event) ->
    if event.keyCode is 13
      $('#submit_message_btn').click()
      event.target.value = ""
      event.preventDefault()

submit_message_via_click = () ->
  $('.fake_submit').on 'click', (event) ->
    press_enter = jQuery.Event "keydown", { keyCode: 13 }
    $("#message_content").trigger(press_enter)


scroll_bottom = () ->
  $('#messages').scrollTop($('#messages')[0].scrollHeight)
