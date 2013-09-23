class User < ActiveRecord::Base
	has_many :stores

	validates :phone_number, uniqueness: true

	has_secure_password :validations => false
	validates :password, length: { minimum: 6 }, :if => :check_phone_number
	def self.from_omniauth(auth)
	  where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
	    user.provider = auth.provider
	    user.uid = auth.uid
	    user.name = auth.info.name
	    user.oauth_token = auth.credentials.token
	    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
	    user.save!
	  end
	end

	def own_store? store
		self.id == store.user_id
	end

	def check_phone_number
		self.phone_number
	end

end
