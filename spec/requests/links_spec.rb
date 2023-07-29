# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Links', type: :request do
  subject { Link.new(url: 'https://www.google.com', slug: 'aaa') }

  describe 'GET /show' do
    context 'when showing a link' do
      it 'should be valid' do
        expect(subject).to be_valid
      end
    end
  end

  describe 'Shortify' do
    context 'when creating a link with valid URL and slug' do
      it 'should be valid' do
        expect(subject).to be_valid
      end
    end

    context 'when trying to creating a link with an invalid URL' do
      subject { Link.new(url: 'google.com', slug: 'aaa') }
      it 'should NOT be valid' do
        expect(subject).not_to be_valid
      end
    end

    context 'when trying to creating a link without slug' do
      subject { Link.new(url: 'google.com', slug: '') }
      it 'should NOT be valid' do
        expect(subject).not_to be_valid
      end
    end
  end
end
