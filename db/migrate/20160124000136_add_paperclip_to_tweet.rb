class AddPaperclipToTweet < ActiveRecord::Migration
  def change
  	add_attachment :tweets, :media  
  end
end
