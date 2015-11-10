class User < ActiveRecord::Base
  validates :user_name, presence: true, length: { maximum: 50 }
  validates :name, presence: true, length: { maximum: 50 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    length: { maximum: 255 },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  
  has_secure_password
  
  def logged_in?
    !self.current_user.nil?
  end
end
