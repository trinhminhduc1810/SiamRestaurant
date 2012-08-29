class User < ActiveRecord::Base
  require 'digest/md5'
  attr_accessible :address, :email, :name, :password, :username, :confirm_password, :old_password
  validates :name, :address, presence: true
  validates :username, uniqueness: true
  validate  :password_confirm_check, :old_password_check
  validates :email, allow_blank: false, format: {
    with: %r{\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b}i,
    message: 'invalid email address'
  }

  attr_accessor :confirm_password, :old_password
  validates_length_of :username, :password, :minimum => 5
  def password_confirm_check
    if confirm_password != password
      errors.add(:confirm_password, "does not matches")
    end
  end

  def old_password_check
    if old_password != password
      errors.add(:old_password, "is incorrect")
    end
  end

  def hash_password(original_password)
    hash = ""
    if original_password.length > 4
      hash = Digest::MD5.hexdigest(original_password)
    end
    return hash
  end
end
