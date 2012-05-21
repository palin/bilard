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
    self.role and self.role.name == "user"
  end

  def owner?
    self.owner and self.role and self.role.name == "owner"
  end

  def admin?
    self.role and self.role.name == "admin"
  end

  def avatar
    hash = Digest::MD5.hexdigest(self.email.squish)
    gravatar = "http://www.gravatar.com/avatar/#{hash}?s=100"
    self.picture.present? ? self.picture : gravatar
  end
end
