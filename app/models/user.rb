class User < ActiveRecord::Base

  acts_as_authentic

  #############
  # CALLBACKS #
  #############

  before_save :encrypt_password, :only => :create

  ##############
  # VALIDATION #
  ##############

  validates_presence_of :login, :email
end
