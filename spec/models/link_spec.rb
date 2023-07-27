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
  end
end
