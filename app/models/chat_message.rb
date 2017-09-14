class ChatMessage < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :sender, foreign_key: "sender_id", class_name: 'User'
end
