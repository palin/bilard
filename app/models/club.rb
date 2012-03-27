class Club < ActiveRecord::Base

  has_many :employees
  has_many :tables
  has_many :reservations, :through => :tables
  has_one :price
  belongs_to :owner

end
