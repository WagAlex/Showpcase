class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :shops
  has_many :bookings
  has_many :comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  after_create :send_welcome_email

  validates :first_name, :last_name, presence: true

  acts_as_messageable

  def send_welcome_email
    UserMailer.welcome_email(self).deliver
  end

  def self.find_for_facebook_oauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name   # assuming the user model has a name
        user.picture = auth.info.image # assuming the user model has an image
        user.fb_token = auth.credentials.token
        user.fb_token_expiry = Time.at(auth.credentials.expires_at)
    end
  end

  def name
    "#{first_name} #{last_name}"
  end

  def mailboxer_email(object)
    email
  end

end
