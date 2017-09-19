class ChatParticipant < ActiveRecord::Base
  belongs_to :conversation
  # belongs_to :user
  # belongs_to :group


  def self.conversation_exists(chatable_type, user, person)
    chatable_ids = []
    chatable_ids << person.connected_user.id if person.connected_user.present?
    chatable_ids << user.id
    count = chatable_ids.count
    user_id = user.id
    person_user_id  = person.connected_user.present? ? person.connected_user.id : 0
    result = ActiveRecord::Base.connection.execute("select conversation_id from chat_participants where chatable_type = '#{chatable_type}' group by conversation_id
               having count(*) = #{count} and count(case when chatable_id not in (#{user_id},#{person_user_id}) then 1 end) = 0").first

    conversation_id = result.present? ? result["conversation_id"] : nil
    conversation_id
  end

  def self.create_participants(conversation, chatable_type, person, user)
    chatable_ids = []
    chatable_ids << person.connected_user.id if person.connected_user.present?
    chatable_ids << user.id
    chatable_ids.each do |cid|
      participant = conversation.chat_participants.build(chatable_type: chatable_type, chatable_id: cid)
      participant.save
    end
    conversation.chat_participants
  end


end
