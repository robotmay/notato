class FileNote < Note
	field :file, type: String
	mount_uploader :file, FileUploader
end
