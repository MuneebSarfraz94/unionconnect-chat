class ChatMessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_message"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
