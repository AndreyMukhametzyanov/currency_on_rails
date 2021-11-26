require 'rails_helper'

RSpec.describe Currency, type: :model do
  describe 'validations' do
    subject { build(:currency) }
    it { should validate_presence_of(:phone) }
  end
end