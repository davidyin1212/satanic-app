namespace :scheduler do
  desc "TODO"
  task update_tweets: :environment do
  	puts "Updating Tweets..."
  	#get users
  	users = User.all
  	puts users
  	users.each do |user|
  		friends = user.twitter.friends()
  		friendsList = []
		tweetsList = []
  		friends.each do |friend_id|
  			friend = Friend.find_by(uid: friend_id.id)
			if friend == nil
				friend = Friend.new()
				friend.uid = friend_id.id
				friend.name = friend_id.name
				friend.save
			end
			friendsList.push(friend)
  			tweets = friend.getTweets(user.twitter, 100)
  			tweets.each do |tweet|
  				if not Tweet.where({:user_id => user.id, :uid => tweet.id}).empty?
					puts "tweets already exists"
					break
				end
				tweet_obj = Tweet.new()
				tweet_obj.post_name = friend.name
				tweet_obj.uid = tweet.id
				tweet_obj.user_id = user.id
				tweet_obj.body = tweet.text
				if tweet.media[0]
					puts "-----text media: " + tweet.media[0].media_url
					tweet_obj.getMedia(tweet.media[0].media_url)
				end
				tweet_obj.save
				tweetsList.push(tweet_obj)
  			end
  		end
  		puts "tweets list: " + tweetsList.to_s
		user.tweets | tweetsList
		puts "friendList: " + friendsList.to_s
		user.friends = friendsList
		user.save
  	end
  end

end
