App.messages = App.cable.subscriptions.create('MessagesChannel', {  
  received: function(data) {
    $("#messages").removeClass('hidden');
    // return $('#messages').append(this.renderMessage(data));
    return $('#messages').prepend(this.renderMessage(data));
    // return $('#messages').prepend(html);
  },
  renderMessage: function(data) {
    return "<p> <b>" + data.user + " said: " + "</b>" + data.created_at + data.message + "</p>";
    // return "<p> <b>" + data.user + " said: " + "</b>" + data.message + "</p>";
  }
});