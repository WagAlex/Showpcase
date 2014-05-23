class Shop < ActiveRecord::Base
  has_many :pictures
  has_many :bookings
#  has_many :renters, through: :bookings
  belongs_to :user


  # validates_attachment :file,
  #                     :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
  #                     :styles => { medium: "400x600>", thumb: "200x150" } #, :default_url => "/images/:style/missing.png"
  #                     :size => { :in => 0..3.megabytes }

end
