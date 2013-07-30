class User < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  attr_accessible :name, :password
  has_many :user_tweets
  has_many :relations
  validates :name, presence: :true 

  def encrypt_password
    if self.password.present?
      self.password = Digest::SHA1.hexdigest(self.password)
    else
      self.password = self.password_was
    end
  end

  def registered?
    if db = User.where(name:"#{self.name}").first
      db_user_name = db.name
      #encrypt_password = Digest::SHA1.hexdigest(self.password)
      encrypt_password = self.password

      if self.name == db_user_name
        if encrypt_password == db.password
          self.id = db.id
          return true
        else
          return false
        end
      else
        return false
      end
    else
      return false
    end
  end
end
