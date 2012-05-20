class User < ActiveRecord::Base

  acts_as_authentic

  ################
  # ASSOCIATIONS #
  ################

  has_one :owner
  belongs_to :role

  #############
  # CALLBACKS #
  #############

  before_save :encrypt_password, :only => :create

  ##############
  # VALIDATION #
  ##############

  validates_presence_of :login, :email

  ##############
  #   METHODS  #
  ##############

  def normal_user?
    self.role.name == "user"
  end

  def owner?
    self.role.name == "owner"
  end

  def admin?
    self.role.name == "admin"
  end
end
