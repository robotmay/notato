class Exif
  include Mongoid::Document
	embedded_in :image_note

	field :width, type: Integer
	field :height, type: Integer
	field :camera_model, type: String
	field :taken_at, type: DateTime
	field :exposure_time, type: String
	field :f_number, type: Float
	field :metadata, type: Hash
end
