class UserTweet < ActiveRecord::Base
  attr_accessible :tweet, :user_id
  belongs_to :user
end
