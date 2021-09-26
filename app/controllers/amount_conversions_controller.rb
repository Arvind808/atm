class AmountConversionsController < ApplicationController
  before_action :set_input_params, only: :show

  def show
    service = AmountConversionService.new(@input_amount)
    render json: service.convertions
  rescue Error::InvalidAmountError => e
    render json: { message: e.message }, status: :unprocessable_entity
  end

  private

  def set_input_params
    @input_amount = params[:input_amount]
  end
end
