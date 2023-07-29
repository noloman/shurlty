class Link < ApplicationRecord
  require 'addressable/uri'
  validates_presence_of :url, :slug
  validates_uniqueness_of :slug
  validates :url, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
  before_validation :generate_slug

  def short
    LinksHelper::LinksHelper.short_url(slug: self.slug, host: Addressable::URI.parse(self.url).host)
  end

  def generate_slug
    slug = SecureRandom.uuid[0..5] if self.slug.nil? || self.slug.empty?
  end

  # the API
  def self.shorten(url, slug = '')
    link = Link.where(url: url, slug: slug).first
    return link.short if link

    link = Link.new(url: url, slug: slug)
    return link.short if link.save

    Link.shorten(url, slug + SecureRandom.uuid[0..2])
  end
end
