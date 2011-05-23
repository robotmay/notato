class Webpage
  include Mongoid::Document
	include Mongoid::Timestamps

	embedded_in :webpage_note

	field :title, 			type: String
	field :titles, 			type: Array
	field :author, 			type: String
	field :authors, 		type: Array
	field :lede, 				type: String
	field :keywords, 		type: Array
	field :body, 				type: String
	field :html_body, 	type: String
	field :feed, 				type: String
	field :feeds, 			type: Array
	field :favicon, 		type: String
	field :description, type: String
	field :datetime, 		type: DateTime
end
