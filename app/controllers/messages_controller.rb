class MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    message.user = current_user
    if message.save
      ActionCable.server.broadcast 'messages',
        message: message.content,
        user: message.user.username,
        created_at: message.created_at 
        # user_id: message.user.id

      head :ok
    end
  end

  private

    def message_params
      params.require(:message).permit(:content, :chatroom_id, :created_at)
    end

end
