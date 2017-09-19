class ApplicationController < ActionController::API
  before_action :set_header
  def set_header
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end
  include Response
  include ExceptionHandler
  def send_cable(message)
      ActionCable.server.broadcast('chat_message',
                                   message: message.content,
                                   conversation_id: message.conversation_id,
                                   count: 1
      )
      head :ok
  end

end
