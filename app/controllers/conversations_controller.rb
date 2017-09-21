class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:show, :update, :destroy]

  def index
    @current_user = User.find_by_single_access_token(params[:accessToken])
    person = Person.find(params[:person_id])
    chatable_type = params[:chatable_type]
    conversation_id = ChatParticipant.conversation_exists(chatable_type, @current_user, person)
    conversation    = conversation_id.present? ? Conversation.find(conversation_id) : Conversation.create(conversation_params)
    chat_participants = !!conversation_id.present? ? conversation.chat_participants :  ChatParticipant.create_participants(conversation, chatable_type, person, @current_user)
    chat_messages = conversation.chat_messages
    response = {conversation: conversation , participants: chat_participants, messages: chat_messages, :success => true}
    json_response(response,params)
  end

  def show
    messages = @conversation.chat_messages.order("created_at")
    participants = @conversation.chat_participants
    response = {conversation: @conversation, messages: messages, participants: participants, :success=> true}
    json_response(response, params)
  end


  def destroy
    @conversation.destroy
    head :no_content
  end

  private

  def conversation_params
    # whitelist params
    params.permit(:name, :created_at, :updated_at)
  end

  def set_conversation
    @conversation = Conversation.find(params[:id])
  end

end
