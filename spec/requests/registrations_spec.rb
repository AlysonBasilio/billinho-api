require 'rails_helper'

RSpec.describe 'Registrations API', type: :request do
  # initialize test data
  let!(:registrations) { create_list(:registration, 10) }
  let(:registration_id) { registrations.first.id }
  let(:institution_id) { registrations.first.institution.id }
  let(:student_id) { registrations.first.student.id }

  # Test suite for GET /registrations
  describe 'GET /registrations' do
    # make HTTP get request before each example
    before { get '/registrations' }

    it 'returns registrations' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /registrations/:id
  describe 'GET /registrations/:id' do
    before { get "/registrations/#{registration_id}" }

    context 'when the record exists' do
      it 'returns the registration' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(registration_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:registration_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Registration/)
      end
    end
  end

  # Test suite for POST /registrations
  describe 'POST /registrations' do
    # valid payload
    let(:valid_attributes) { { value: '9000.00', invoice_qty: '10', expiration_date: '15', course: 'COMP', institution: institution_id, student: student_id } }

    context 'when the request is valid' do
      before { post '/registrations', params: valid_attributes }

      it 'creates a registration' do
        expect(json['value']).to eq(9000)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/registrations', params: { value: 9000, expiration_date: 15, course: 'COMP', institution: institution_id, student: student_id } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Invoice_qty can't be blank/)
      end
    end
  end

  # Test suite for PUT /registrations/:id
  describe 'PUT /registrations/:id' do
    let(:valid_attributes) { { name: 'UFC' } }

    context 'when the record exists' do
      before { put "/registrations/#{registration_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /registrations/:id
  describe 'DELETE /registrations/:id' do
    before { delete "/registrations/#{registration_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

end
