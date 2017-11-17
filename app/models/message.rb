class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
end
