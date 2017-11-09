class Device < ActiveRecord::Base

  has_many :user_chat_messages, :class_name => 'UserChatMessage'
  has_and_belongs_to_many :messages
  belongs_to :user


end
