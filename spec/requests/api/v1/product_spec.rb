# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Product API', type: :request do
  before { host! 'api.pdvend.test' }

  let(:headers) do
    {
      'Accept' => 'application/vnd.pdvend.v1',
      'Content-Type' => 'application/json'
    }
  end

  describe 'POST /products' do
    before do
      post '/products', params: {
        product: product_params
      }.to_json, headers: headers
    end

    context 'when valid request' do
      let(:product_params) { attributes_for(:product) }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the json for created product' do
        expect(json_body[:data][:attributes][:name]).to eq(product_params[:name])
      end
    end
  end
end
