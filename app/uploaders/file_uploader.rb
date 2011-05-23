class FileUploader < CarrierWave::Uploader::Base
	def sanitize_regexp
		/[^[:word:]\.\-\+]/
	end
end
