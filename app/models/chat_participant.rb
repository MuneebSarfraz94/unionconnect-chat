class ChatParticipant < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user
  belongs_to :group


  def self.conversation_exists(chatable_type, chatable_ids)
    chatable_ids << person.user
    count = chatable_ids.count
    non_array_ids = chatable_ids
    result = ActiveRecord::Base.connection.execute("select conversation_id from chat_participants where chatable_type = '#{chatable_type}' group by conversation_id
               having count(*) = #{count} and count(case when chatable_id not in (#{non_array_ids}) then 1 end) = 0").first

    conversation_id = result.present? ? result["conversation_id"] : nil
    conversation_id
  end

  def self.create_participants(conversation, chatable_type, chatable_ids)
    chatable_ids = chatable_ids.tr('[]', '').split(',').map(&:to_i)
    chatable_ids.each do |cid|
      participant = conversation.chat_participants.build(chatable_type: chatable_type, chatable_id: cid)
      participant.save
    end
    conversation.chat_participants
  end


end
