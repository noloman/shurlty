class Link < ApplicationRecord
  include Rails.application.routes.url_helpers
  require 'addressable/uri'
  validates_presence_of :url, :slug
  validates_uniqueness_of :slug
  validates :url, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])

  def short
    LinksHelper::LinksHelper.short_url(slug: self.slug, host: Addressable::URI.parse(self.url).host)
  end
end
