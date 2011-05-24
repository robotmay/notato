class Notepatch
  include Mongoid::Document
	belongs_to :user
	embeds_many :notes

	field :title, type: String
	field :subdomain, type: String

	validates :title, presence: true
	validates :subdomain, presence: true, uniqueness: true

	index :subdomain, unique: true
end
