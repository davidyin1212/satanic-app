class Friend < ActiveRecord::Base
	has_many :tweets
	belongs_to :user

	def getTweets(twitter, count = 2)
		puts "friend id: " + self.uid.to_s
		twitter.user_timeline(self.uid, {:count => count})
	end
end
