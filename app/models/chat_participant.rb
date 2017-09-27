class ChatParticipant < ActiveRecord::Base
  belongs_to :conversation
  # belongs_to :user
  # belongs_to :group


  def self.conversation_exists(chatable_type, user, chatable)
    chatable_ids = []
    chatable_ids << chatable.connected_user.id if chatable_type=='User' && chatable.connected_user.present?
    chatable_ids << chatable.id if chatable_type=='Group'
    chatable_ids << user.id if chatable_type=='User'
    count = chatable_ids.count
    user_id = user.id
    person_user_id  = chatable.connected_user.present? ? chatable.connected_user.id : 0 if chatable_type=='User'
    conditional_ids = chatable_type=='User' ? "#{user_id},#{person_user_id}": "#{chatable.id}"
    result = ActiveRecord::Base.connection.execute("select conversation_id from chat_participants where chatable_type = '#{chatable_type}' group by conversation_id
               having count(*) = #{count} and count(case when chatable_id not in (#{conditional_ids}) then 1 end) = 0").first

    conversation_id = result.present? ? result["conversation_id"] : nil
    conversation_id
  end

  def self.create_participants(conversation, chatable_type, person, user, group)
    chatable_ids = []
    chatable_ids << person.connected_user.id if person.present? && person.connected_user.present?
    chatable_ids << group.id if group.present?
    chatable_ids << user.id if chatable_type == 'User'
    chatable_ids.each do |cid|
      participant = conversation.chat_participants.build(chatable_type: chatable_type, chatable_id: cid)
      participant.save
    end
    conversation.chat_participants
  end


end
