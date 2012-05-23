class Table < ActiveRecord::Base

  has_many :reservations
  belongs_to :club

  validates_presence_of :owner_id, :club_id
end
