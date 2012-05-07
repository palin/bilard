class User < ActiveRecord::Base

  acts_as_authentic

  ################
  # ASSOCIATIONS #
  ################

  has_one :owner

  #############
  # CALLBACKS #
  #############

  before_save :encrypt_password, :only => :create

  ##############
  # VALIDATION #
  ##############

  validates_presence_of :login, :email
end
