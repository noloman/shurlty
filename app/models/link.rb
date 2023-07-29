# frozen_string_literal: true

class Link < ApplicationRecord
  require 'addressable/uri'
  validates_presence_of :url, :slug
  validates_uniqueness_of :slug
  validates :url, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
  before_validation :generate_slug

  def short
    LinksHelper::LinksHelper.short_url(slug:, host: Addressable::URI.parse(url).host)
  end

  def generate_slug
    SecureRandom.uuid[0..5] if slug.nil? || slug.empty?
  end

  # the API
  def self.shorten(url, slug = '')
    link = Link.where(url:, slug:).first
    return link.short if link

    link = Link.new(url:, slug:)
    return link.short if link.save

    Link.shorten(url, slug + SecureRandom.uuid[0..2])
  end
end
