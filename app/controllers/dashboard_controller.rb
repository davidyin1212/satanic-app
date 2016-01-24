class DashboardController < ApplicationController
	def index
		# @friends = current_user.twitter.friends()
		# @friendsList = []
		# @tweetsList = []
		# @friends.each do |friend_id|
		# 	friend = Friend.find_by(uid: friend_id.id)
		# 	if friend == nil
		# 		friend = Friend.new()
		# 		friend.uid = friend_id.id
		# 		friend.name = friend_id.name
		# 		friend.save
		# 	end
		# 	puts "friend: " + friend.to_s 
		# 	@friendsList.push(friend)
		# 	tweets = friend.getTweets(current_user.twitter)
		# 	tweets.each do |tweet|
		# 		if not Tweet.where({:user_id => current_user.id, :uid => tweet.id}).empty?
		# 			puts "tweets already exists"
		# 			break
		# 		end
		# 		tweet_obj = Tweet.new()
		# 		tweet_obj.post_name = friend.name
		# 		tweet_obj.uid = tweet.id
		# 		tweet_obj.user_id = current_user.id
		# 		tweet_obj.body = tweet.text
		# 		if tweet.media[0]
		# 			puts "-----text media: " + tweet.media[0].media_url
		# 			tweet_obj.getMedia(tweet.media[0].media_url)
		# 		end
		# 		tweet_obj.save
		# 		@tweetsList.push(tweet_obj)
		# 	end
		# end
		# puts "tweets list: " + @tweetsList.to_s
		# current_user.tweets | @tweetsList
		# puts "friendList: " + @friendsList.to_s
	# current_user.friends = @friendsList
		# current_user.save
		# #download
		puts "here are the params: " + params.to_s
		#get tweets on date
		if params[:date] == nil
			puts "DATE TODAY"
			@tweets = current_user.tweets_by_date(Date.today)
		else
			puts "DATE SET BY USER"
			date = Date.parse(params[:date])
			@tweets = current_user.tweets_by_date(date)
		end
	end

	def update_date
		redirect_to dashboard_index_url + "?date=" + params[:date]
	end
end
