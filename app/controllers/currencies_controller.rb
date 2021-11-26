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

  def load
    Parser.new.xml_into_hash.each do |el|
      Currency.create(el)
    end
    render json: { status: :ok }
  end

  def update_rates
    Parser.new.xml_into_hash.each do |data_set|
      currency = Currency.find_by(num_code: data_set[:num_code])
      currency.update(data_set)
    end
    render json: { status: :ok }
  end
end