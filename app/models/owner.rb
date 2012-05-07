class Owner < ActiveRecord::Base

  acts_as_authentic

  has_many :clubs
  has_many :tables,    :through => :clubs
  has_many :employees, :through => :clubs
  has_many :prices,    :through => :clubs


  belongs_to :user

  before_save :encrypt_password, :only => :create

end
