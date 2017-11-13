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
  def send_cable(message,sender_id,user_id,timeAgo,senderInitials)
    sender =  User.find_by_id sender_id
      ActionCable.server.broadcast('chat_message',
                                   message: message.content,
                                   conversation_id: message.conversation_id,
                                   user_id: user_id,
                                   sender_id: message.sender_id,
                                   timeAgo: timeAgo,
                                   sender: "#{sender.first_name} #{sender.last_name}",
                                   senderInitials: senderInitials,
                                   count: 1
      )
      head :ok
  end

end
