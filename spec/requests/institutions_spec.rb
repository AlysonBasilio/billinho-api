require 'rails_helper'

RSpec.describe 'Institutions API', type: :request do
  # initialize test data
  let!(:institutions) { create_list(:institution, 10) }
  let(:institution_id) { institutions.first.id }

  # Test suite for GET /institutions
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

  # Test suite for GET /institutions/:id
  describe 'GET /institutions/:id' do
    before { get "/institutions/#{institution_id}" }

    context 'when the record exists' do
      it 'returns the institution' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(institution_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:institution_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Institution/)
      end
    end
  end

  # Test suite for POST /institutions
  describe 'POST /institutions' do
    # valid payload
    let(:valid_attributes) { { name: 'ITA', cnpj: '01254789632', institution_type: 'Universidade' } }

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

  # Test suite for PUT /institutions/:id
  describe 'PUT /institutions/:id' do
    let(:valid_attributes) { { name: 'UFC' } }

    context 'when the record exists' do
      before { put "/institutions/#{institution_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /institutions/:id
  describe 'DELETE /institutions/:id' do
    before { delete "/institutions/#{institution_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
