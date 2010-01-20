class User < ActiveRecord::Base
  
  attr_accessor :confirm_password
  
  validate :password_match
  encrypt :password
  encrypt :confirm_password
  
  
  def password_match
    errors.add(:password, "confirmation must match.") if self.password_changed? && (self.password != self.confirm_password)
  end
  
end
