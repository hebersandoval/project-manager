class User < ActiveRecord::Base
  # callback ensures email uniqueness by downcasing the email attribute
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 25 }
  validates :email, presence: true, length: { maximum: 50 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
