class Link < ApplicationRecord
  validates_presence_of :url, :slug
  validates_uniqueness_of :slug
  validates :url, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
end
