class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
    	t.integer :user_id
      t.integer :uid,  :limit => 8
      t.timestamps null: false
    end
    add_index :friends, :uid 
  end
end
