# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Link, type: :model do
  context 'upon creation' do
    it 'must have URL and slug' do
      link = Link.create(url: 'https://www.google.com', slug: 'google')
      expect(link).to be_valid
    end

    it 'needs to have both URL and slug' do
      expect { Link.create! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'shortens a URL to a slug of 6 chars and numbers' do
      link = Link.new(url: 'https://www.google.com')
      link.generate_slug
      expect(link).not_to be_nil
      expect(link.slug).not_to be_nil
      expect(link.slug.length).to eq 6
    end

    it 'does NOT generate the same slug for the same URL' do
      link1 = Link.new(url: 'https://www.google.com')
      link1.generate_slug
      link2 = Link.new(url: 'https://www.google.com')
      link2.generate_slug
      expect(link1.slug).not_to be_nil
      expect(link2.slug).not_to be_nil
      expect(link1.slug).not_to eq(link2.slug)
    end
  end
end
