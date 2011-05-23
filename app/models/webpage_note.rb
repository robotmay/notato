class WebpageNote < Note
	embeds_one :webpage

	field :url, type: String

	validates :url, presence: true

	after_save :fetch_page

	def fetch_page
		doc = Pismo::Document.new(self.url)
		if doc
			webpage = self.create_webpage(
				title: 				doc.title,
				titles: 			doc.titles,
				author: 			doc.author,
				authors: 			doc.authors,
				lede: 				doc.lede,
				keywords: 		doc.keywords,
				body: 				doc.body,
				html_body: 		doc.html_body,
				feed: 				doc.feed,
				feeds: 				doc.feeds,
				favicon: 			doc.favicon,
				description: 	doc.description,
				datetime: 		doc.datetime
			)
			self.title ||= webpage.title
			self.save
		end
	end
	handle_asynchronously :fetch_page
end
