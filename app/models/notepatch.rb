class Notepatch
  include Mongoid::Document
	belongs_to :user
	embeds_many :notes

	field :title, type: String
	field :public, type: Boolean
	field :subdomain, type: String

	validates :title, presence: true
	validates :subdomain, presence: true, uniqueness: true, if: :public

	index :subdomain, unique: true

	def public?
		self.public
	end
end
