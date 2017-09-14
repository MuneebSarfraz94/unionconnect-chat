class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:show, :update, :destroy]

  def create
    chatable_type = params[:chatable_type]
    chatable_ids =  params[:chatable_ids]

    conversation_id = ChatParticipant.conversation_exists(chatable_type, chatable_ids)
    conversation    = conversation_id.present? ? Conversation.find(conversation_id) : Conversation.create(conversation_params)
    chat_participants = !!conversation_id.present? ? conversation.chat_participants :  ChatParticipant.create_participants(conversation, chatable_type, chatable_ids)
    chat_messages = conversation.chat_messages
    response = {conversation: conversation , participants: chat_participants, messages: chat_messages, :success => true}
    json_response(response)
  end

  def show
    messages = @conversation.chat_messages.order("created_at")
    participants = @conversation.chat_participants
    response = {conversation: @conversation, messages: messages, participants: participants, :success=> true}
    json_response(response)
  end


  def destroy
    @conversation.destroy
    head :no_content
  end

  private

  def conversation_params
    # whitelist params
    params.permit(:name)
  end

  def set_conversation
    @conversation = Conversation.find(params[:id])
  end

end
