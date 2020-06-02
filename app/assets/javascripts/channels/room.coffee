
App.room = App.cable.subscriptions.create channel: "RoomChannel", room_id: 24,
  connected: ->
  console.log('connected...');
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log(data)
    # $('#messages').append data['message']
    # #speak function
    # $(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
    #   if event.keyCode is 13 # return/enter = send
    #     App.room.speak event.target.value
    #     event.target.value = ''
    #     event.preventDefault()

    #   speak: (message) ->
    #     @perform 'speak', message: message