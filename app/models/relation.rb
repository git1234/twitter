class Relation < ActiveRecord::Base
  attr_accessible :followed_id, :following_id
  belongs_to :user
end
