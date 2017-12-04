class UserChatMessagesController < ApplicationController

  def index
    @user = User.find_by_single_access_token(params[:accessToken])
    conversation= Conversation.find_by_id(params[:conversation_id])
    if !params[:create]
        conversation.chat_messages.each do |message|
          message.mark_as_read! for: @user
         end
      end
    readable_messages_count = conversation&.chat_messages.where.not(sender_id: @user.id).unread_by(@user).count
    conversation = conversation.attributes.merge!(unreadCount: readable_messages_count)
    response = {conversation: conversation,  :success => true}
    json_response(response,params)
  end

  private

  def user_chat_message_params
    params.permit(:unseen, :created_at, :updated_at)
  end

end
