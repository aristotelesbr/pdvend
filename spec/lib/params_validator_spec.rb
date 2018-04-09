# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Product API', type: :request do
  let!(:product) { create(:product) }
  before { host! 'api.pdvend.test' }

  let(:headers) do
    {
      'Accept' => 'application/vnd.pdvend.v1',
      'Content-Type' => 'application/json'
    }
  end

  describe 'POST /search' do
    before do
      post '/products/search', params: {
        search: search_params
      }.to_json, headers: headers
    end

    context 'when valid request' do
      let!(:search_params) do
        attributes_for(
          :product,
          id: product.id,
          zip_code_origin: '85253100',
          zip_code_dinatation: '64020350'
        )
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when invalid request' do
      let!(:search_params) { attributes_for(:product, zip_code_origin: '') }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'return error messages' do
        expect(json_body[:base]).to eq(['Parâmentros inválidos.'])
      end
    end
  end

  describe '#product_exists' do
    before do
      post '/products/search', params: {
        search: search_params
      }.to_json, headers: headers
    end

    context 'when valid product' do
      let!(:search_params) do
        attributes_for(
          :product,
          id: product.id,
          zip_code_origin: '85253100',
          zip_code_dinatation: '64020350'
        )
      end

      it 'return json with product attribute id' do
        expect(json_body[0][:product][:id]).to eq(product.id)
      end
    end

    context 'when invalid data' do
      let!(:search_params) do
        attributes_for(
          :product,
          id: 10_000,
          zip_code_origin: '85253100',
          zip_code_dinatation: '64020350'
        )
      end

      it 'returns errors messages' do
        expect(json_body[:base]).to eq(['Produto não encontrado.'])
      end
    end
  end
end
