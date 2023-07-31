# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Link, type: :model do
  context 'upon creation' do
    it 'must have URL and slug' do
      link = Link.create(url: 'https://www.google.com', slug: 'google')
      expect(link).to be_valid
    end

    it 'should automatically create a slug when saved' do
      link = Link.create!(url: 'https://www.google.com')
      expect(link).to be_valid
    end

    it 'shortens a URL to a slug of 6 chars and numbers' do
      link = Link.new(url: 'https://www.google.com')
      link.save
      expect(link).not_to be_nil
      expect(link.slug).not_to be_nil
      expect(link.slug.length).to eq 6
    end

    it 'does generate the same slug for the same URL' do
      link1 = Link.create(url: 'https://www.google.com')
      link2 = Link.create(url: 'https://www.google.com')
      expect(link1.slug).not_to be_nil
      expect(link2.slug).not_to be_nil
      expect(link1.slug).to eq(link2.slug)
    end
  end
end
