class ChatMessagesController < ApplicationController
  before_action :set_conversation, only: [:create]
  before_action :set_sender, only: [:create]


  def create
    @message = @conversation.chat_messages.build(chat_message_params)
    @message.save

    send_cable(@message)
    json_response(@message)
  end

  private
  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def chat_message_params
    params.permit(:conversation_id, :sender_id, :content)
  end

  def set_sender
    @sender = User.find(params[:sender_id])
  end
end
