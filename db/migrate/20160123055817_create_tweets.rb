class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
    	t.integer :user_id
      t.integer :uid,  :limit => 8
      t.text :body
      t.timestamps null: false
    end
    add_index :tweets, :uid 
    add_index :tweets, :user_id
  end
end
