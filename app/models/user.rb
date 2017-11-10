class User < ActiveRecord::Base
  acts_as_reader
  has_many :chat_messages, :foreign_key => 'sender_id'
  has_many :chat_participants, :as => :chatable
  has_many :associated_persons, :foreign_key => 'user_id' , class_name: 'Person'
  has_many :user_chat_messages, :foreign_key=>'user_id',class_name:'UserChatMessage'
  has_many :conversations, through: :chat_participants, :foreign_key => 'conversation_id'
  def fullname
    "#{self.first_name} #{self.last_name}"
  end

  def chatables

  end
  

end

