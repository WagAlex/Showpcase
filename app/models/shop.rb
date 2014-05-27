class Shop < ActiveRecord::Base
  has_many :pictures
  has_many :bookings
  belongs_to :user

  scope :uncreated, where(:created_at => nil)

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
