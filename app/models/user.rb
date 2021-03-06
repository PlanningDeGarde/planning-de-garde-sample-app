class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:planningdegarde]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email      = auth.info.email
      user.password   = Devise.friendly_token[0,20]
      user.token      = auth.credentials.token
    end
  end

  def to_s
    email
  end

  def api_client
    @api_client ||= PlanningDeGarde::API.new(token)
  end
end
