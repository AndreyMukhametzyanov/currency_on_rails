require 'rails_helper'

RSpec.describe CurrenciesController, type: :request do
  subject { JSON.parse(response.body).with_indifferent_access }

  describe '#index' do
    let!(:currency) { create_list :currency, 3 }
    let(:record_keys) { %w[id num_code char_code nominal name value created_at updated_at] }

    before { get currencies_path }

    it 'should returns all currencies with status ok' do
      expect(response).to have_http_status(200)
      expect(subject[:status]).to eq('ok')
      expect(subject[:data].count).to eq(currency.count)
      expect(subject[:data].first.keys).to match_array(record_keys)
    end
  end

  describe '#show' do
    before { get currency_path(currency_char_code) }
    context 'when record exist' do
      let!(:currency) { create :currency }
      let(:currency_char_code) { currency.char_code }

      it 'returns currency' do
        expect(response).to have_http_status(200)
        expect(subject[:status]).to eq('ok')
        expect(subject[:data].class).to eq(ActiveSupport::HashWithIndifferentAccess)

        expect(subject.dig(:data, :num_code)).to eq(currency.num_code)
        expect(subject.dig(:data, :char_code)).to eq(currency.char_code)
        expect(subject.dig(:data, :nominal)).to eq(currency.nominal)
        expect(subject.dig(:data, :name)).to eq(currency.name)
        expect(subject.dig(:data, :value)).to eq(currency.value)
      end
    end

    context 'when record not exist' do
      let(:currency_char_code) { 'WEW' }
      it 'returns error message' do
        expect(response).to have_http_status(200)
        expect(subject[:status]).to eq('not_found')
      end
    end
  end

  describe '#load' do
      before do
        expect(Parser).to receive(:xml_into_hash).and_return(fake_data)
        post load_currencies_path
      end

      let(:fake_data) {
        [{ num_code: '036', char_code: 'AUD', nominal: 1, name: 'Австралийский доллар', value: 53.0 }] }

      it 'should load all currencies into db' do
        expect(response).to have_http_status(200)
        expect(subject[:status]).to eq('ok')
        expect(Currency.find_by(num_code: fake_data.first[:num_code]).num_code).to eq(fake_data.first[:num_code])
        expect(Currency.find_by(char_code: fake_data.first[:char_code]).char_code).to eq(fake_data.first[:char_code])
        expect(Currency.find_by(nominal: fake_data.first[:nominal]).nominal).to eq(fake_data.first[:nominal])
        expect(Currency.find_by(name: fake_data.first[:name]).name).to eq(fake_data.first[:name])
        expect(Currency.find_by(value: fake_data.first[:value]).value).to eq(fake_data.first[:value])
      end
  end
  describe '#update_rates' do

  end
end
