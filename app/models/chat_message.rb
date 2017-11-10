class ChatMessage < ActiveRecord::Base
  acts_as_readable on: :created_at
  belongs_to :conversation
  belongs_to :sender, foreign_key: "sender_id", class_name: 'User'
end
