require 'rails_helper'

RSpec.describe 'Invoices API', type: :request do
  # initialize test data
  let!(:invoices) { create_list(:invoice, 10) }
  let(:invoice_id) { invoices.first.id }

  # Test suite for GET /invoices
  describe 'GET /invoices' do
    # make HTTP get request before each example
    before { get '/invoices' }

    it 'returns invoices' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /invoices/:id
  describe 'GET /invoices/:id' do
    before { get "/invoices/#{invoice_id}" }

    context 'when the record exists' do
      it 'returns the invoice' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(invoice_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:invoice_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Institution/)
      end
    end
  end

  describe 'PUT /invoices/:id' do
    let(:valid_attributes) { { status: 'Aberta' } }

    context 'when the record exists' do
      before { put "/invoices/#{invoice_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

end
