# frozen_string_literal: true

# Api namaspace
module Api
  module V1
    # Product controller
    class ProductsController < ApplicationController
      def create
        product = Product.new(product_params)
        if product.save
          render json: product
        else
          render json: product.errors.full_messages, status: :unprocessable_entity
        end
      end

      def search
        product_with_zip_code = ParamsValidator.new(params[:search])
        if product_with_zip_code.valid_params
          product_with_shipping = Searchable.new(params[:search]).product_with_shipping
          render json: product_with_shipping
        else
          render json: product_with_zip_code.errors, status: :unprocessable_entity
        end
      end

      private

      def product_params
        params.require(:product).permit(:name,
                                        :description,
                                        :product_value,
                                        :height,
                                        :weight,
                                        :width,
                                        :product_length)
      end
    end
  end
end
