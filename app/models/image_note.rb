class ImageNote
	include Mongoid::Document
	embedded_in :note
	embeds_one :exif

	field :is_photo, type: Boolean, default: false
	field :image, type: String
	mount_uploader :image, ImageUploader

	after_save :extract_metadata

	def extract_metadata
		image = EXIFR::JPEG.new(self.image.url)
		if image.exif?
			self.is_photo = true
			self.exif.create_exif(image.to_hash)
			self.save
		end
		#TODO Extract XMP
	end
	handle_asynchronously :extract_metadata
end
