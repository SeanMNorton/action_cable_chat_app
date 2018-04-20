App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    unless data.content.blank?
      $('#messages-table').append '<div class="message">' +
        '<div class="message-user">' + data.username + ":" + '</div>' +
        '<div class="message-content">' + data.content + '</div>' + '</div>'

$(document).on 'turbolinks:load', ->
  submit_message()
  submit_message_via_click()

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
