class Link
  include Mongoid::Document

	has_and_belongs_to_many :notes
end
