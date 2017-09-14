class CreateChatParticipants < ActiveRecord::Migration[5.1]
  def change
    create_table :chat_participants do |t|
      t.integer :conversation_id
      t.integer :chatable_id
      t.string :chatable_type
    end
  end
end
