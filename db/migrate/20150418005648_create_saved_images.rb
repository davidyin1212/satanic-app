class CreateSavedImages < ActiveRecord::Migration
  def change
    create_table :saved_images do |t|
      t.integer :user_id
      t.string :image_url

      t.timestamps null: false
    end
  end
end
