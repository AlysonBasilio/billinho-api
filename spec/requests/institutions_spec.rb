require 'rails_helper'

RSpec.describe 'Institutions API', type: :request do
  # initialize test data
  let!(:institutions) { create_list(:institution, 10) }
  let(:institution_id) { institutions.first.id }

  # Test suite for GET /todos
  describe 'GET /institutions' do
    # make HTTP get request before each example
    before { get '/institutions' }

    it 'returns institutions' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for POST /institutions
  describe 'POST /institutions' do
    # valid payload
    let(:valid_attributes) { { name: 'ITA', cnpj: '01254789632', institution_type: 'Universidade'} }

    context 'when the request is valid' do
      before { post '/institutions', params: valid_attributes }

      it 'creates a institution' do
        expect(json['name']).to eq('ITA')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/institutions', params: { cnpj: '01251289632', institution_type: 'Universidade' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Name can't be blank/)
      end
    end
  end

end
