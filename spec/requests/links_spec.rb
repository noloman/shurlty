# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LinksController, type: :controller do
  context 'GET #show' do
    let(:link) do
      Link.create!(url: 'https://www.google.com', slug: '8d82cf')
    end
    it 'should respond successfully' do
      get :show, params: { slug: link.slug }
      expect(response).to have_http_status(:success)
    end
  end

  context 'links_controller#create' do
  end
end
