class Conversation < ActiveRecord::Base


  has_many :chat_participants , :dependent => :destroy
  has_many :chat_messages

  def participants
    self.chat_participants
  end


end
