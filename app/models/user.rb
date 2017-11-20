class User < ApplicationRecord
  has_many :messages
  has_many :chatrooms, through: :messages

  validates :username, presence: true, uniqueness: true

  def avatar_url
    "https://robohash.org/#{id}.png?set=set3"
  end 

end
