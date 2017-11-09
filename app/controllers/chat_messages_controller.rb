class ChatMessagesController < ApplicationController
  include ActionView::Helpers::DateHelper
  before_action :set_conversation, only: [:create, :index]
  before_action :set_sender, only: [:create]


  def index
   @messages = @conversation.chat_messages.order("created_at")
   @user = User.find_by_single_access_token(params[:accessToken])
   @messages = @messages.collect do |message|
     time_ago = time_ago_in_words(message.created_at)
     sender = User.find(message.sender_id)
     message.attributes.merge!(
         currentUser: (message.sender_id==@user.id ? true : false),
         timeAgo:"#{sender.first_name} #{sender.last_name}"  + time_ago,
         senderInitials: sender.last_name[0..1]
     )
   end
   response = {messages: @messages, :count => @messages.length, :success => true}
   json_response(response, params)
  end

  def create
    @message = @conversation.chat_messages.build(chat_message_params)
    @message.sender_id = @sender.id
    @message.save
    @user = User.find_by_single_access_token(params[:accessToken])
    time_ago = time_ago_in_words(@message.created_at)
    sender = User.find(@message.sender_id)
    sender_id = sender.id,
    user_id = @user.id,
    timeAgo ="#{sender.first_name} #{sender.last_name}"  + time_ago,
    senderInitials = sender.last_name[0..1]
    send_cable(@message,sender_id,user_id,timeAgo,senderInitials)
    # json_response(@message,params)
  end

  private
  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def chat_message_params
    params.permit(:conversation_id, :sender_id, :content,:created_at, :updated_at)
  end

  def set_sender
    @sender = User.find_by_single_access_token(params[:accessToken])
  end
end
