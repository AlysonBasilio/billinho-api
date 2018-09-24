class RegistrationsController < ApplicationController
  before_action :set_registration, only: [:show, :update, :destroy]

  # GET /registrations
  def index
    @registrations = Registration.all
    json_response(@registrations)
  end

  # POST /registrations
  def create
    @registration = Registration.create!(registration_params)
    $i = 0
    $remaining_value = @registration.value
    $today = Date.current()
    if @registration.expiration_date > $today.day
      $payment_day = Date.new($today.year, $today.month, @registration.expiration_date)
    else
      $today = $today.advance({months: 1})
      $payment_day = Date.new($today.year, $today.month, @registration.expiration_date)
    end
    while $i < @registration.invoice_qty  do
      if $i < @registration.invoice_qty - 1
        $value = (@registration.value/@registration.invoice_qty).round(2)
        $remaining_value -= $value
      else
        $value = $remaining_value
      end

      # Create Invoice
      @registration.invoices.create({value: $value, expiration_date: $payment_day, registration_id: @registration.id})

      $payment_day = $first_payment_day.advance({months: 1})
      $i += 1
    end
    json_response(@registration, :created)
  end

  # GET /registrations/:id
  def show
    json_response(@registration)
  end

  # DELETE /registrations/:id
  def destroy
    @registration.destroy
    head :no_content
  end

  private

  def registration_params
    # whitelist params
    params.permit(:value, :invoice_qty, :expiration_date, :course, :institution_id, :student_id)
  end

  def set_registration
    @registration = Registration.find(params[:id])
  end
end
