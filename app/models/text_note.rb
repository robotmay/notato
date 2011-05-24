class TextNote
	include Mongoid::Document
	embedded_in :note

	MARKUP_FORMATS = %w[markdown textile rdoc org creole mediawiki]
	LANGUAGES = []

	field :body, type: String
	field :rendered_body, type: String
	field :format, type: String, default: "text"

	validates :body, presence: true

	after_save :render

	def render
		self.rendered_body =  if MARKUP_FORMATS.includes?(self.format)
														GitHub::Markup.render("#{self.title}.#{format}", self.body)
													elsif LANGUAGES.includes?(self.format)
														#TODO Syntax highlighting
													else
														self.body
													end
		self.save
	end
	handle_asynchronously :render
end
