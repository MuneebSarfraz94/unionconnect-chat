class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:show, :update, :destroy]

 #  end

  def index
    @current_user = User.find_by_single_access_token(params[:accessToken])
    group =  StandardGroup.find(params[:group_id]) if !!params[:group_id]
    conversation = group.conversation.present? ? group.conversation.id:Conversation.create(conversation_params)
    chat_messages = conversation.chat_messages
    readable_messages = @current_user.user_chat_messages.where.not(chat_message_id: @current_user.chat_messages.ids)
    readable_messages_count =readable_messages.where(conversation_id:conversation.id,unseen:true).count
    conversation = conversation.attributes.merge!(unreadCount: readable_messages_count)
    response = {conversation: conversation , messages: chat_messages, :success => true}
    json_response(response,params)

    #    person = Person.find(params[:person_id]) if params[:person_id]
    #    chatable_type = params[:chatable_type]
    #    conversation_id = chatable_type == 'User' ?  ChatParticipant.conversation_exists(chatable_type, @current_user, person): ChatParticipant.conversation_exists(chatable_type, @current_user, group)
    #    conversation    = conversation_id.present? ? Conversation.find(conversation_id) : Conversation.create(conversation_params)
    #    chat_participants = !!conversation_id.present? ? conversation.chat_participants :  ChatParticipant.create_participants(conversation, chatable_type, person, @current_user, group)
    #    chat_messages = conversation.chat_messages
    #    readable_messages = @current_user.user_chat_messages.where.not(chat_message_id: @current_user.chat_messages.ids)
    #    readable_messages_count =readable_messages.where(conversation_id:conversation.id,unseen:true).count
    #    conversation = conversation.attributes.merge!(unreadCount: readable_messages_count)
    #    response = {conversation: conversation , participants: chat_participants, messages: chat_messages, :success => true}
    #    json_response(response,params)
  end

  def show
    messages = @conversation.chat_messages.order("created_at")
    participants = @conversation.chat_participants
    response = {conversation: @conversation, messages: messages, participants: participants, :success=> true}
    json_response(response, params)
  end

  def representative_conversations
    @user = User.find_by_single_access_token params[:accessToken] if !!params[:accessToken]
    participants=ChatParticipant.where(chatable_type:'User',chatable_id: @user.id).pluck(:conversation_id)
    conversations = Conversation.find participants
    conversations = conversations.collect {|conversation|
      readable_messages_count = conversation.chat_messages.where.not(sender_id: @user.id).unread_by(@user).count
      user = User.find_by_id conversation.user_id
      conversation.attributes.merge!(name: "#{user&.first_name} #{user&.last_name}", unreadCount: readable_messages_count,image: user.last_name[0..1], dateCreated: conversation.created_at )
    }
    response = {conversations: conversations , :success => true}
    json_response(response, params)

  end


  def destroy
    @conversation.destroy
    head :no_content
  end

  private

  def conversation_params
    # whitelist params
    params.permit(:name, :created_at, :updated_at,:user_id, :group_id)
  end

  def set_conversation
    @conversation = Conversation.find(params[:id])
  end

end
