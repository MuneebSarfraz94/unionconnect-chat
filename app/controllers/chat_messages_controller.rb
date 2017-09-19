class ChatMessagesController < ApplicationController
  before_action :set_conversation, only: [:create, :index]
  before_action :set_sender, only: [:create]


  def index
   @messages = @conversation.chat_messages.order("created_at DESC")
   response = {messages: @messages, :count => @messages.length, :success => true}
   json_response(response, params)
  end

  def create

    @message = @conversation.chat_messages.build(chat_message_params)
    @message.sender_id = @sender.id
    @message.save
    send_cable(@message)
    # json_response(@message)
  end

  private
  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def chat_message_params
    params.permit(:conversation_id, :sender_id, :content)
  end

  def set_sender
    @sender = User.find_by_single_access_token(params[:accessToken])
  end
end
