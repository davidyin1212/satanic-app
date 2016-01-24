class Tweet < ActiveRecord::Base
	has_attached_file :media, styles: { medium: "300x300>", thumb: "100x100>" }
  	validates_attachment_content_type :media, content_type: /\Aimage\/.*\Z/
	belongs_to :user

	def getMedia(url)
		self.media = URI.parse(url)
	    # Assuming url_value is http://example.com/photos/face.png
	    # avatar_file_name == "face.png"
	    # avatar_content_type == "image/png"
	    @media_remote_url = url
	end
end
