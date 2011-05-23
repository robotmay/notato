class ImageUploader < CarrierWave::Uploader::Base
	def sanitize_regexp
		/[^[:word:]\.\-\+]/
	end

	def extension_white_list
		%w(jpg jpeg gif png)
	end
end
