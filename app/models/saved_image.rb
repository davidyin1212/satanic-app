class SavedImage < ActiveRecord::Base
	belongs_to :user

	validates :user_id, :image_url, presence: true
end
