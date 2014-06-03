class Shop < ActiveRecord::Base
  has_many :pictures
  has_many :bookings
  has_many :comments
  belongs_to :user

  scope :uncreated, where(:created_at => nil)
  geocoded_by :street_address
  after_validation :geocode, :if => :street_address_changed?
end
