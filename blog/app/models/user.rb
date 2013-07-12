class User < ActiveRecord::Base
  require 'digest/md5'
  attr_accessible :email_string, :first_name, :last_name, :password, :password_confirmation
  before_save :encrypt_password
  
  validates :first_name,
  :presence => TRUE,
  :length => {
    :minimum => 2,
    :allow_blank => TRUE
  }
  
  validates :last_name,
  :presence => TRUE
  :length => {
    :minimum => 2,
    :allow_blank => TRUE
  }
  
  validates :password,
  :presence => TRUE,
  :length = {
    :minumum => 6 
    
  },
  :confirmation => TRUE
  validates :password_confirmation,
  :presence => TRUE
  
  def encrypt_password
    self.password = Digest::MD5.hexdigest(password)
  end
end
