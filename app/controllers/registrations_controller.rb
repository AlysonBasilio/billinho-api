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
    json_response(@registration, :created)
  end

  # GET /registrations/:id
  def show
    json_response(@registration)
  end

  # PUT /registrations/:id
  def update
    @registration.update(registration_params)
    head :no_content
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
