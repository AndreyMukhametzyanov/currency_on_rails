require 'rails_helper'

RSpec.describe CurrenciesController, type: :request do
  subject { JSON.parse(response.body).with_indifferent_access }

  describe '#index' do
    let!(:currency) { create_list :currency, 1 }
    let(:record_keys) { %w[id num_code char_code nominal name value] }

    before { get currency_path }

    it 'should return all currencies with status ok' do
      puts subject[:data]
      # expect(response).to have_http_status(200)
      # expect(subject[:status]).to eq('ok')
      # expect(subject[:data].count).to eq(user.count)
      # expect(subject[:data].first.keys).to match_array(record_keys)
    end
  end
end