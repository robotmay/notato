class Note
  include Mongoid::Document
	include Mongoid::Timestamps
	include Mongoid::Paranoia

	#has_and_belongs_to_many :links

	field :title, type: String
end
