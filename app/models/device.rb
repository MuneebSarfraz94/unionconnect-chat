class Device < ActiveRecord::Base

  has_many :user_chat_messages, :class_name => 'UserChatMessage'
  has_and_belongs_to_many :messages
  belongs_to :user


  def self.send_ios_notifications(message,national)
    conversation = Conversation.find_by_id(message.conversation_id)
    chat_participants = conversation.chat_participants
    group_id = chat_participants&.first&.chatable_id if chat_participants.exists?(chatable_type:'Group')
    url = URI.parse("http://10.28.83.53:3000/api/v2/push_notifications?app_id=#{national.app_id}&message=#{message.content}&group_id=#{group_id}&sender_id=#{message.sender_id}&conversation_id=#{message.conversation_id}")
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    puts "--------------#{res.body}----------------------"
  end

end
