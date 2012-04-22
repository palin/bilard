class Owner < ActiveRecord::Base

  acts_as_authentic

  has_many :clubs
  has_many :tables,    :through => :clubs
  has_many :employees, :through => :clubs
  has_many :prices,    :through => :clubs

  before_save :encrypt_password, :only => :create

  validates_presence_of :login, :email
end
