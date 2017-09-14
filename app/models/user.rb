class User < ActiveRecord::Base

  has_many :chat_messages, :foreign_key => 'sender_id'
  has_many :chat_participants, :as => :chatable


  def fullname
    "#{self.first_name} #{self.last_name}"
  end
  

end

