# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Searchable, type: :model do
  describe '#product_with_cauculed' do
    before do
      @request = Searchable.new(search_params).product_with_shipping
    end
    context 'when valid data' do
      let!(:product) { create(:product) }
      let(:search_params) do
        attributes_for(
          :product,
          id: product.id,
          zip_code_origin: '85253100',
          zip_code_dinatation: '64020350'
        )
      end

      it 'returns two objects' do
        expect(@request.count).to eq(2)
      end

      it 'returns key with pac and sedex object' do
        expect(@request[1]).to include(:pac).and include(:sedex)
      end

      it 'returns object with shipping value' do
        expect(@request[1][:pac].valor).to be_a_kind_of(Float)
      end
    end
  end
end
