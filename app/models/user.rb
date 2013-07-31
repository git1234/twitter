class User < ActiveRecord::Base
  attr_accessible :image, :name, :password, :profile, :avatar
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/system/missing/:style/missing.jpg"

  validates :name, presence: :true
  validates :password, presence: :true
  # validates_attachment :avatar, presence: true,
  #   content_type: { content_type: ["image/jpg", "image/png"] },
  #   size: { less_than: 2.megabytes }

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
