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
      expect(subject[:data].count).to eq(posts.count)
      expect(subject[:data].first.keys).to match_array(record_keys)
    end
  end

  describe '#show' do
    context 'when record exist' do

    end
  end
end