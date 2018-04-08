# frozen_string_literal: true

# Params Validator
class ParamsValidator
  include ActiveModel::Validations
  include ActiveModel::Model

  attr_accessor :params

  def initialize(params)
    @params = params
  end

  def valid_params
    return false unless valid_object
    :ok
  end

  def valid_object
    valid?
    !all_data_present? && !product_exists?
  end

  private

  def all_data_present?
    return if [params[:id], params[:zip_code_origin], params[:zip_code_dinatation]].all?(&:present?)
    errors.add(:base, 'Parâmentros inválidos.')
  end

  def product_exists?
    return if Product.exists?(id: params[:id])
    errors.add(:base, 'Produto não encontrado.')
  end
end
