class User < ActiveRecord::Base
	has_many :tweets
	has_many :friends

	def self.find_or_create_from_auth_hash(auth_hash)
		# Lookup or Create user
		user = where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create
		user.update(name: auth_hash.info.name, 
			profile_image: auth_hash.info.image, 
			token: auth_hash.credentials.token,
			secret: auth_hash.credentials.secret)
		user
	end

	def twitter
		@client ||= Twitter::REST::Client.new do |config|
		  config.consumer_key        = Rails.application.secrets.twitter_api_key
		  config.consumer_secret     = Rails.application.secrets.twitter_api_secret
		  config.access_token        = token
		  config.access_token_secret = secret
		end
	end

	def tweets_by_date(date)
		Tweet.where({:user_id => self.id, :created_at => date.beginning_of_day..date.end_of_day})
	end
end
