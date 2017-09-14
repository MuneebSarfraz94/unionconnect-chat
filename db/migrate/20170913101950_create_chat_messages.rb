class CreateChatMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :chat_messages do |t|
      t.integer :sender_id
      t.text :content
      t.integer :conversation_id
    end
  end
end
