class User < ApplicationRecord
  before_save { self.email = email.downcase } 
  has_many :todos

  has_secure_password
  validates :name, :email, :password, presence: true
  validates :email, uniqueness: { case_sensitive: false}
  validates :password, length: { minimum: 3 }
end
