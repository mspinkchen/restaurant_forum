class Friendship < ApplicationRecord
  validates :friend_id, uniqueness: {scope: :user_id}

  belongs_to :user
  belongs_to :friend
end
