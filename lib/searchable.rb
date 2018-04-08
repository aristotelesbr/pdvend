# frozen_string_literal: true

require 'correios-frete'

# Searchable class
class Searchable
  attr_accessor :params, :product
  def initialize(params)
    @product = Product.find(params[:id])
    @params = params
  end

  def product_with_shipping
    @normalized_params = sanatize_zip_code(@params)
    @build_shipping = build_shipping(@product, @normalized_params)
    [{ product: @product }, @build_shipping]
  end

  private

  def build_shipping(product, params)
    limiter = 0
    shipping = Correios::Frete::Calculador.new do |f|
      f.cep_origem = params[0]
      f.cep_destino = params[1]
      f.peso = product.weight
      f.comprimento = product.product_length
      f.largura = product.width
      f.altura = product.height
    end
    shipping.calculate(:sedex, :pac)
  rescue StandardError
    if limiter < 3
      limiter += 1
      retry
    end
  end

  def sanatize_zip_code(params)
    @params = {
      zip_code_origin: params[:zip_code_origin],
      zip_code_dinatation: params[:zip_code_dinatation]
    }
    @params = @params.map { |_k, v| to_br_cep(v) }
  end

  def to_br_cep(string_number)
    string_number.gsub(/^(.{5})(.{3})$/, '\1-\2')
  end
end
