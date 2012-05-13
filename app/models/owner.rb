class Owner < ActiveRecord::Base

  has_many :clubs
  has_many :tables,    :through => :clubs
  has_many :employees, :through => :clubs
  has_many :prices,    :through => :clubs


  belongs_to :user

end
