class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :update, :destroy]

  # GET /invoices
  def index
    @invoices = Invoice.all
    json_response(@invoices)
  end

  # GET /invoices/:id
  def show
    json_response(@invoice)
  end

  # PUT /invoices/:id
  def update
    @invoice.update(invoice_params)
    head :no_content
  end

  private

  def invoice_params
    # whitelist params
    params.permit(:status)
  end

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end
end
