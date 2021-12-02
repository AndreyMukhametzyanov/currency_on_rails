class CurrenciesController < ApplicationController
  def index
    currencies = Currency.all
    render json: { status: :ok, data: currencies }
  end
  #место для коментариев
  def show
    currency = Currency.find_by(char_code: params[:char_code])
    if currency
      render json: { status: :ok, data: currency }
    else
      render json: { status: :not_found }
    end
  end
  #место для коментариев
  def load
    Parser.xml_into_hash.each do |el|
      Currency.create(el)
    end
    render json: { status: :ok }
  end
  #место для коментариев
  def update_rates
    Parser.xml_into_hash.each do |data_set|
      currency = Currency.find_by(num_code: data_set[:num_code])
      currency.update(data_set)
    end
    render json: { status: :ok }
  end
  #место для коментариев
end