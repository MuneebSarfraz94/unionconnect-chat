class ChatMessage < ActiveRecord::Base
  acts_as_readable on: :created_at
  belongs_to :conversation
  belongs_to :sender, foreign_key: "sender_id", class_name: 'User'

  # after_save :send_push_notifications

  def self.send_push_notifications(message, national)
    Device.send_ios_notifications(message,national)
  end
end


