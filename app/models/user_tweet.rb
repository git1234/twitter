class UserTweet < ActiveRecord::Base
  attr_accessible :tweet, :user_id
  belongs_to :user
  validates :user_id, presence: :true
  validates :tweet, presence: :true
end
