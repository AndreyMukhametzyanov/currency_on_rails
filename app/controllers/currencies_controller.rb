class CurrenciesController < ApplicationController
  def index
    currencies = Currency.all
    render json: { status: :ok, data: currencies }
  end

  def show
    currency = Currency.find_by(CharCode: params[:CharCode])
    if currency
      render json: { status: :ok, data: currency }
    else
      render json: { status: :not_found }
    end
  end

  def load_currencies
    Parser.new.xml_into_hash.each do |el|
      Currency.create(el)
    end
    render json: { status: :ok }
  end

  def update_rates

    render json: { status: :ok }

  end

  private

  def currency_params
    params.require(:currency).permit(:NumCode, :CharCode, :Nominal, :Name, :Value)
  end
end