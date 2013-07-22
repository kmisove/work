class User < ActiveRecord::Base
  require 'digest/md5'
  attr_accessible :email_string, :first_name, :last_name, :password, :password_confirmation,
  
  before_save :encrypt_password
  
  
  
  validates_length_of :first_name,
  :presence => TRUE,
  :minimum   => 3,
  :maximum   => 12,
  :too_short => "must have at least {{count}} words",
  :too_long  => "must have at most {{count}} words",
  :allow_blank => TRUE 
  
  
  validates_length_of :last_name, 
  :presence => TRUE,
  :minimum   => 3,
  :maximum   => 12,
  :too_short => "must have at least {{count}} words",
  :too_long  => "must have at most {{count}} words",
  :allow_blank => TRUE 
  
  
  validates_length_of :password,
  :presence => TRUE,
  :minimum   => 6,
  :maximum => 32,
  :too_short => "must have at least {{count}} words",
  :too_long  => "must have at most {{count}} words",
  :allow_blank => TRUE,
  
  :confirmation => TRUE
  validates :password_confirmation,
  :presence => TRUE
  
  def encrypt_password
    self.password = Digest::MD5.hexdigest(password)
  end
end
