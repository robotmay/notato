class Note
  include Mongoid::Document
	include Mongoid::Timestamps
	include Mongoid::Paranoia

	belongs_to :user
	#has_and_belongs_to_many :links

	field :title, type: String
	validates :title, length: { maximum: 300 }, allow_blank: true

	after_save :generate_links

	def generate_links
		# Function to replace to generate the links depending on content. By default should do title
	end
end
