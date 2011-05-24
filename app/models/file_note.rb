class FileNote
	include Mongoid::Document
	embedded_in :note
	field :file, type: String
	mount_uploader :file, FileUploader
end
