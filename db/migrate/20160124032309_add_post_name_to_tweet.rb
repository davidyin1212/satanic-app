class AddPostNameToTweet < ActiveRecord::Migration
  def change
  	add_column :tweets, :post_name, :string
  end
end
