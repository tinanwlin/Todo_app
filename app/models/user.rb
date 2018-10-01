class User < ApplicationRecord
  before_save { self.email = email.downcase } 
  has_many :todos

  has_secure_password

  def self.authenticate_with_credentials email, password
      email.strip!
      email.downcase!
    if user = User.find_by(email: email).try(:authenticate, password)
      user
    else
      nil
    end
  end
end
