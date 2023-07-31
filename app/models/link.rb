# frozen_string_literal: true

# app/models/Link
class Link < ApplicationRecord
  require 'uri'
  require 'digest'
  validates_presence_of :url, :slug
  validates_uniqueness_of :slug
  validates :url, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
  before_validation :generate_slug

  def short
    LinksHelper::LinksHelper.short_url(slug:, host: Addressable::URI.parse(url).host)
  end

  def generate_slug
    self.slug = Digest::SHA1.hexdigest(url).slice(0..5) if slug.nil? || slug.empty?
  end
end
