class Message < ApplicationRecord

  belongs_to :user
  belongs_to :chat_room

  after_create_commit { broadcast_append_to chat_room }
  before_create :confirm_participant

  def confirm_participant
    return unless chat_room.is_private

    is_participant = Participant.where(user_id: self.user.id, chat_room_id: self.chat_room.id).first
    throw :abort unless is_participant
  end

end
